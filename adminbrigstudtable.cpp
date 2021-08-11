#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include "adminbrigstudtable.h"

AdminBrigStudTable::AdminBrigStudTable(QSqlDatabase database)
{

}

void AdminBrigStudTable::updateTable()
{
    if(!_table)
        return;
    QSqlQuery tableQuerry(_database);
    tableQuerry.exec("SELECT * FROM get_brig_stud()");
    _table->setQuery(tableQuerry);
}

QString AdminBrigStudTable::getBrigStudId(int index)
{
    return _table->data(QAbstractTableModel::createIndex(index,0)).toString();
}

int AdminBrigStudTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount(parent);
}

int AdminBrigStudTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return 3;

}

QVariant AdminBrigStudTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();

    QModelIndex validatedIndex = QAbstractTableModel::createIndex(index.row(),index.column()+1);
    return _table->data(validatedIndex,role);
}

QVariant AdminBrigStudTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();

    return _table->headerData(section+1,orientation,role);
}

QVariantList AdminBrigStudTable::select(int command)
{
    if(!_table)
        return QVariantList();

    QSqlQuery tableQuerry(_database);
    switch (command) {
        case Commands::GetBrigades:
        {
            QVariantList list;
            tableQuerry.exec("SELECT * FROM get_brigades()");
            while(tableQuerry.next())
            {
                list.append(tableQuerry.value(1));
            }
            return list;
        }
        case Commands::GetStudents:
        {
            QVariantList list;
            tableQuerry.exec("SELECT * FROM get_students()");
            while(tableQuerry.next())
            {
                list.append(tableQuerry.value(1));
            }
            return list;
        }
    }
    return QVariantList();
}

bool AdminBrigStudTable::execute(int command, QVector<QString> params)
{
    if(!_table)
        return false;

    QSqlQuery procedureQuery(_database);
    QString query;
    bool res;
    switch (command) {
        case Commands::Insert:
        {
            query = QString("CALL add_student_in_brigade(%1,%2);").arg("'" + params[1] + "'",
                                                                  "'" + params[2] + "'");
            break;
        }
        case Commands::Delete:
        {
            query = QString("CALL remove_from_brigade(%1);").arg(getBrigStudId(params[0].toInt()));
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

bool AdminBrigStudTable::open()
{
    QSqlQuery tableQuerry(_database);
    if(!tableQuerry.exec("SELECT * FROM get_brig_stud()"))
        return false;

    _table = new QSqlQueryModel();
    _table->setQuery(tableQuerry);
    return true;
}
