#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include "adminpaymenttable.h"

AdminPaymentTable::AdminPaymentTable(QSqlDatabase database)
{
    _database = database;
}

void AdminPaymentTable::updateTable()
{
    if(!_table)
        return;

    QSqlQuery tableQuerry(_database);
    tableQuerry.exec("SELECT * FROM get_payments()");
    _table->setQuery(tableQuerry);
}

QString AdminPaymentTable::getWorkId(int index)
{
    return _table->data(QAbstractTableModel::createIndex(index,0)).toString();
}

int AdminPaymentTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount();

}

int AdminPaymentTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return 6;
}

QVariant AdminPaymentTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();


    QModelIndex validatedIndex = QAbstractTableModel::createIndex(index.row(),index.column()+2);
    if(validatedIndex.column() == 7)
        return _table->data(validatedIndex,role).toString();
    return _table->data(validatedIndex,role);

}

QVariant AdminPaymentTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();

    return _table->headerData(section+2,orientation,role);
    //Работа выполнена Сулохиным Родионом Романовичем
}

QVariantList AdminPaymentTable::select(int command)
{
    if(!_table)
        return QVariantList();

    QSqlQuery tableQuerry(_database);
    switch (command) {
        case Commands::GetWorkingStudents:
        {
            tableQuerry.exec("SELECT * FROM get_working_students()");
            QVariantList list;
            while (tableQuerry.next()) {
                list.append(tableQuerry.value(0));
            }
            return list;
        }

    }

    return QVariantList();
}

bool AdminPaymentTable::execute(int command, QVector<QString> params)
{
    if(!_table)
        return false;

    QSqlQuery procedureQuery(_database);
    QString query;
    bool res;
    switch (command) {
        case Commands::Insert:
        {
            query = QString("CALL add_work(%1,%2,%3,%4);").arg("'" + params[1] + "'",
                                                               "'" + params[2] + "'",
                                                               "'" + params[3] + "'",
                                                               "'" + params[4] + "'");
            break;

        }
        case Commands::Update:
        {
            query = QString("CALL update_work(%1,%2,%3,%4);").arg(getWorkId(params[0].toInt()),
                                                             "'" + params[2] + "'",
                                                             "'" + params[3] + "'",
                                                             "'" + params[4] + "'");
            break;
        }
        case Commands::Delete:
        {
            query = QString("CALL delete_work(%1);").arg(getWorkId(params[0].toInt()));
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

bool AdminPaymentTable::open()
{
    QSqlQuery tableQuerry(_database);
    if(!tableQuerry.exec("SELECT * FROM get_payments()"))
        return false;

    _table = new QSqlQueryModel();
    _table->setQuery(tableQuerry);
    return true;
}


