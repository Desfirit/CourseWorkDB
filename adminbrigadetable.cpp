#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include <QSet>

#include "adminbrigadetable.h"

AdminBrigadeTable::AdminBrigadeTable(QSqlDatabase database)
{
    _database = database;
}

QString AdminBrigadeTable::getBrigadeId(int index)
{
    return _table->data(QAbstractTableModel::createIndex(index,0)).toString();
}

void AdminBrigadeTable::updateTable()
{
    if(!_table)
        return;
    QSqlQuery tableQuerry(_database);
    tableQuerry.exec("SELECT * FROM get_brigades()");
    _table->setQuery(tableQuerry);
}

int AdminBrigadeTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;
    return _table->rowCount(parent);
}

int AdminBrigadeTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;
    return 4;
}

QVariant AdminBrigadeTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();
    QModelIndex validatedIndex = QAbstractTableModel::createIndex(index.row(), index.column()+1);

    QVariant res = _table->data(validatedIndex,role);
    if(index.column() == 3 && res.isNull())
        return QVariant("Нет лидера");

    return res;
}

QVariant AdminBrigadeTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();
    return _table->headerData(section+1,orientation,role);
}

QVariantList AdminBrigadeTable::select(int command)
{
    if(!_table)
        return QVariantList();

    QSqlQuery tableQuerry(_database);
    switch (command) {
        case Commands::GetUniqueLeaders:
        {
            QSet<QString> set;
            int n = _table->rowCount();
            for(int i = 0; i < n; ++i)
                set.insert(_table->data(QAbstractTableModel::createIndex(i,1)).toString());

            set.insert("Нет лидера");
            return QVariantList(set.begin(),set.end());
        }
        case Commands::GetUniqueObjects:
        {
            QVariantList list;
            tableQuerry.exec("SELECT * FROM get_objects()");
            while(tableQuerry.next())
            {
                list.append(tableQuerry.value(1));
            }
            return list;
        }
    }
    return QVariantList();
}

bool AdminBrigadeTable::execute(int command, QVector<QString> params)
{
    if(!_table)
        return false;

    QSqlQuery procedureQuery(_database);
    QString query;
    bool res;
    if(params[3] == "Нет лидера")
        params[3] = "";
    switch (command) {
        case Commands::Insert:
        {
            query = QString("CALL create_brigade(%1,%2,%3);").arg("'" + params[1] + "'",
                                                                  "'" + params[2] + "'",
                                                                  params[3].isEmpty()? "NULL" : "'" + params[3] + "'");
            break;
        }
        case Commands::Update:
        {
            query = QString("CALL update_brigade(%1,%2,%3,%4);").arg(getBrigadeId(params[0].toInt()),"'" + params[1] + "'",
                                                                     "'" + params[2] + "'",
                                                                     params[3].isEmpty()? "NULL" : "'" + params[3] + "'");
            break;
        }
        case Commands::Delete:
        {
            query = QString("CALL remove_brigade(%1);").arg(getBrigadeId(params[0].toInt()));
            break;
        }
    }
    res = procedureQuery.exec(query);
    if(!res)
    {
        qDebug() << procedureQuery.lastError();
        qDebug() << query;
    }
    updateTable();
    return res;
}

bool AdminBrigadeTable::open()
{
    QSqlQuery tableQuerry(_database);
    if(!tableQuerry.exec("SELECT * FROM get_brigades()"))
        return false;

    _table = new QSqlQueryModel();
    _table->setQuery(tableQuerry);
    return true;
}
