#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include "adminobjecttable.h"

AdminObjectTable::AdminObjectTable(QSqlDatabase database)
{
    _database = database;
}

void AdminObjectTable::updateTable()
{
    if(!_table)
        return;

    QSqlQuery tableQuerry(_database);
    tableQuerry.exec("SELECT * FROM get_objects()");
    _table->setQuery(tableQuerry);
}

QString AdminObjectTable::getObjectId(int index)
{
    return _table->data(QAbstractTableModel::createIndex(index,0)).toString();
}

int AdminObjectTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount(parent);
}

int AdminObjectTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return 2;
}

QVariant AdminObjectTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();

    QModelIndex validatedIndex = QAbstractTableModel::createIndex(index.row(),index.column() + 1);
    return _table->data(validatedIndex,role);
}

QVariant AdminObjectTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();

    return _table->headerData(section+1,orientation,role);
}

QVariantList AdminObjectTable::select(int command)
{
    if(!_table)
        return QVariantList();
    return QVariantList();
}

bool AdminObjectTable::execute(int command, QVector<QString> params)
{
    if(!_table)
        return false;

    QSqlQuery procedureQuery(_database);
    QString query;
    bool res;
    switch (command) {
        case Commands::Insert:
        {
            query = QString("CALL add_object(%1,%2);").arg("'" + params[1] + "'",
                                                        "'" + params[2] + "'");
            break;
        }
        case Commands::Update:
        {
            query = QString("CALL update_object(%1,%2,%3);").arg(getObjectId(params[0].toInt()),
                                                             "'" + params[1] + "'",
                                                             "'" + params[2] + "'");
            break;
        }
        case Commands::Delete:
        {
            query = QString("CALL remove_object(%1);").arg(getObjectId(params[0].toInt()));
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

bool AdminObjectTable::open()
{
    QSqlQuery tableQuerry(_database);
    if(!tableQuerry.exec("SELECT * FROM get_objects()"))
        return false;

    _table = new QSqlQueryModel();
    _table->setQuery(tableQuerry);
    return true;
}
