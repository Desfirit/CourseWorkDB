#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include <QSqlQueryModel>
#include "studentprofile.h"

StudentProfile::StudentProfile(QSqlDatabase database)
{
    _database = database;
}

int StudentProfile::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount(parent);
}

int StudentProfile::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->columnCount(parent);
}

QVariant StudentProfile::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();

    return _table->data(index,role);
}

QVariant StudentProfile::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();

    return _table->headerData(section,orientation,role).toString();
}

QVariantList StudentProfile::select(int command)
{
    return QVariantList();
}

bool StudentProfile::execute(int command, QVector<QString> params)
{
    return false;
}

bool StudentProfile::open()
{
    QSqlQuery tableQuery(_database);
    if(!tableQuery.exec("SELECT * FROM get_profile()"))
    {
        qDebug() << tableQuery.lastError();
        return false;
    }
    _table = new QSqlQueryModel();
    _table->setQuery(tableQuery);
    return true;
}
