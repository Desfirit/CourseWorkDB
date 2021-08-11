#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include <QSqlQueryModel>

#include "adminstudenttable.h"

AdminStudentTable::AdminStudentTable(QSqlDatabase database)
{
    _database = database;
}

QString AdminStudentTable::getStudentId(int index)
{
    return _table->data(createIndex(index,0)).toString();
}

void AdminStudentTable::updateTable()
{
    if(!_table)
        return;

    QSqlQuery tableQuerry(_database);
    tableQuerry.exec("SELECT * FROM get_students()");
    _table->setQuery(tableQuerry);
}


int AdminStudentTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount(parent);
}

int AdminStudentTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return 3;
}

QVariant AdminStudentTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();

    QModelIndex validatedIndex = index.column() == 2? QAbstractTableModel::createIndex(index.row(),4) : QAbstractTableModel::createIndex(index.row(),index.column()+1);
    return _table->data(validatedIndex,role);

}

QVariant AdminStudentTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();


    section = section == 2? 4 : section + 1;
    return _table->headerData(section,orientation,role);
}

bool AdminStudentTable::execute(int command, QVector<QString> params)
{
    if(!_table)
        return false;

    QSqlQuery procedureQuery(_database);
    QString query;
    bool res;
    switch (command) {
        case Commands::Delete:
        {
            query = QString("CALL remove_student(%1);").arg(getStudentId(params[0].toInt()));
            break;
        }

        case Commands::Insert:
        {
            query = QString("CALL add_student(%1, %2, %3);").arg("'" + params[1] + "'",
                                                                         params[2],
                                                                         "'" + params[3] + "'");
            break;
        }
        case Commands::Update:
        {
            query = QString("CALL change_student(%1, %2, %3, %4)").arg(getStudentId(params[0].toInt()),
                                                                                "'"+params[1]+"'",
                                                                                params[2],
                                                                                "'" +params[3] + "'");
            break;
        }
    }
    res = procedureQuery.exec(query);
    updateTable();
    return res;
}

bool AdminStudentTable::open()
{
    QSqlQuery tableQuerry(_database);
    if(!tableQuerry.exec("SELECT * FROM get_students()"))
        return false;

    _table = new QSqlQueryModel();
    _table->setQuery(tableQuerry);
    return true;
}


QVariantList AdminStudentTable::select(int command)
{
    if(!_table)
        return QVariantList();

    QSqlQuery tableQuerry(_database);
    switch (command) {
        case Commands::GetUniqueGroups:
            tableQuerry.exec("SELECT * FROM get_groups()");
            QVariantList list;
            while(tableQuerry.next())
            {
                list.append(tableQuerry.value(1));
            }
            return list;
    }

    return QVariantList();
}
