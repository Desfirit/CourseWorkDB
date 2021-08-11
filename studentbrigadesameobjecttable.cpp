#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include <QSqlQueryModel>
#include "studentbrigadesameobjecttable.h"

StudentBrigadeSameObjectTable::StudentBrigadeSameObjectTable(QSqlDatabase database)
{
    _database = database;
}

int StudentBrigadeSameObjectTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount(parent);
}

int StudentBrigadeSameObjectTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->columnCount(parent);
}

QVariant StudentBrigadeSameObjectTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();

    return _table->data(index,role);
}

QVariant StudentBrigadeSameObjectTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();

    return _table->headerData(section,orientation,role);
}

QVariantList StudentBrigadeSameObjectTable::select(int command)
{
    return QVariantList();
}

bool StudentBrigadeSameObjectTable::execute(int command, QVector<QString> params)
{
    return false;
}

bool StudentBrigadeSameObjectTable::open()
{
    QSqlQuery tableQuery(_database);
    if(!tableQuery.exec("SELECT * FROM get_brigades_same_object()"))
    {
        qDebug() << tableQuery.lastError();
        return false;
    }

    _table = new QSqlQueryModel();
    _table->setQuery(tableQuery);
    return true;
}


