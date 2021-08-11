#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include "admingrouptable.h"

AdminGroupTable::AdminGroupTable(QSqlDatabase database)
{
    _database = database;
}

void AdminGroupTable::updateTable()
{
    if(!_table)
        return;

    QSqlQuery tableQuerry(_database);
    tableQuerry.exec("SELECT * FROM get_groups()");
    _table->setQuery(tableQuerry);
}

QString AdminGroupTable::getGroupId(int index)
{
    return _table->data(QAbstractTableModel::createIndex(index,0)).toString();
}

int AdminGroupTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount(parent);
}

int AdminGroupTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;
    return 1;
}

QVariant AdminGroupTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();
    QModelIndex validatedIndex = QAbstractTableModel::createIndex(index.row(),1);
    return _table->data(validatedIndex,role);
}

QVariant AdminGroupTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();
    return _table->headerData(section+1, orientation, role);
}

QVariantList AdminGroupTable::select(int command)
{
    if(!_table)
        return QVariantList();
    return QVariantList();
}

bool AdminGroupTable::execute(int command, QVector<QString> params)
{
    if(!_table)
        return false;

    QSqlQuery procedureQuery(_database);
    QString query;
    bool res;
    switch (command) {
        case Commands::Insert:
        {
            query = QString("CALL add_group(%1);").arg("'" + params[1] + "'");
            break;
        }
        case Commands::Update:
        {
            query = QString("CALL update_group(%1,%2);").arg(getGroupId(params[0].toInt()),
                                                             "'" + params[1] + "'");
            break;
        }
        case Commands::Delete:
        {
            query = QString("CALL delete_group(%1);").arg(getGroupId(params[0].toInt()));
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

bool AdminGroupTable::open()
{
    QSqlQuery tableQuerry(_database);
    if(!tableQuerry.exec("SELECT * FROM get_groups()"))
        return false;

    _table = new QSqlQueryModel();
    _table->setQuery(tableQuerry);
    return true;
}
