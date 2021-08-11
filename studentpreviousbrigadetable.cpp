#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include <QSqlQueryModel>
#include "studentpreviousbrigadetable.h"

StudentPreviousBrigadeTable::StudentPreviousBrigadeTable(QSqlDatabase database)
{
    _database = database;
}

int StudentPreviousBrigadeTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount(parent);
}

int StudentPreviousBrigadeTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->columnCount(parent);
}

QVariant StudentPreviousBrigadeTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();

    return _table->data(index,role);
}

QVariant StudentPreviousBrigadeTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();

    return _table->headerData(section,orientation,role);
}

QVariantList StudentPreviousBrigadeTable::select(int command)
{
    return QVariantList();
}

bool StudentPreviousBrigadeTable::execute(int command, QVector<QString> params)
{
    return false;
}

bool StudentPreviousBrigadeTable::open()
{
    QSqlQuery tableQuery(_database);
    if(!tableQuery.exec("SELECT * FROM get_previous_brigade()"))
    {
        qDebug() << tableQuery.lastError();
        return false;
    }

    _table = new QSqlQueryModel();
    _table->setQuery(tableQuery);
    return true;
}
