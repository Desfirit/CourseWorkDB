#ifndef ADMINSTUDENTTABLE_H
#define ADMINSTUDENTTABLE_H

#include <QtSql/QSqlDatabase>

#include "itable.h"

class AdminStudentTable : public ITable
{
public:
    AdminStudentTable(QSqlDatabase database);

    enum Commands{
        Insert = Qt::UserRole,
        Update,
        Delete,
        GetUniqueGroups,
    };



private:
    QString getStudentId(int index);
    void updateTable();

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const;
    int columnCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QVariant headerData(int section, Qt::Orientation orientation, int role) const;

    // ITable interface
public:
    QVariantList select(int command);
    bool execute(int command, QVector<QString> params);
    bool open();

};

#endif // ADMINSTUDENTTABLE_H
