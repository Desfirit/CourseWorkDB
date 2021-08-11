#ifndef ADMINVIEWTABLE_H
#define ADMINVIEWTABLE_H

#include <QtSql/QSqlDatabase>

#include "itable.h"

class AdminViewTable : public ITable
{
public:
    AdminViewTable(QSqlDatabase database);

    enum Commands{
        Insert = Qt::UserRole,
        Update,
        Delete,
    };



private:

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

#endif // ADMINVIEWTABLE_H
