#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include <QSqlQueryModel>
#include "adminviewtable.h"

AdminViewTable::AdminViewTable(QSqlDatabase database)
{
    _database = database;
}

int AdminViewTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount(parent);
}

int AdminViewTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return 5;
}

QVariant AdminViewTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();

    QModelIndex validatedIndex = QAbstractTableModel::createIndex(index.row(),index.column()+1);
    return _table->data(validatedIndex,role);
}

QVariant AdminViewTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();

    return _table->headerData(section+1,orientation,role);
}

QVariantList AdminViewTable::select(int command)
{
    return QVariantList();
}

bool AdminViewTable::execute(int command, QVector<QString> params)
{
    return true;
}

bool AdminViewTable::open()
{
    QSqlQuery tableQuery(_database);
    if(!tableQuery.exec("SELECT * FROM get_view()"))
        return false;

    _table = new QSqlQueryModel();
    _table->setQuery(tableQuery);
    return true;
}
