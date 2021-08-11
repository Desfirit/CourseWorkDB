#ifndef ADMINBRIGSTUDTABLE_H
#define ADMINBRIGSTUDTABLE_H

#include <QtSql/QSqlDatabase>

#include "itable.h"

class AdminBrigStudTable : public ITable
{
public:
    AdminBrigStudTable(QSqlDatabase database);

    enum Commands{
        Insert = Qt::UserRole,
        Update,
        Delete,
        GetStudents,
        GetBrigades,
    };

private:
    void updateTable();
    QString getBrigStudId(int index);

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

#endif // ADMINBRIGSTUDTABLE_H
