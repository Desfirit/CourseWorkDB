#ifndef ADMINBRIGADETABLE_H
#define ADMINBRIGADETABLE_H

#include <QtSql/QSqlDatabase>

#include "itable.h"

class AdminBrigadeTable : public ITable
{
public:
    AdminBrigadeTable(QSqlDatabase database);


    enum Commands{
        Insert = Qt::UserRole,
        Update,
        Delete,
        GetUniqueObjects,
        GetUniqueLeaders
    };

private:
    QString getBrigadeId(int index);
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

#endif // ADMINBRIGADETABLE_H
