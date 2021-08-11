#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include <QSqlQueryModel>
#include "studentpaymenttable.h"

StudentPaymentTable::StudentPaymentTable(QSqlDatabase database)
{
    _database = database;
}

int StudentPaymentTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount(parent);
}

int StudentPaymentTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->columnCount(parent);
}

QVariant StudentPaymentTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();

    if(index.column() == 4)
        return _table->data(index,role).toString();
    return _table->data(index,role);
}

QVariant StudentPaymentTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();

    return _table->headerData(section,orientation,role);
}

QVariantList StudentPaymentTable::select(int command)
{
    return QVariantList();
}

bool StudentPaymentTable::execute(int command, QVector<QString> params)
{
    return false;
}

bool StudentPaymentTable::open()
{
    QSqlQuery tableQuery(_database);
    if(!tableQuery.exec("SELECT * FROM get_user_payments()"))
    {
        qDebug() << tableQuery.lastError();
        return false;
    }

    _table = new QSqlQueryModel();
    _table->setQuery(tableQuery);
    return true;
}
