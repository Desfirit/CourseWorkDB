#ifndef ADMINGROUPTABLE_H
#define ADMINGROUPTABLE_H

#include <QtSql/QSqlDatabase>

#include "itable.h"

class AdminGroupTable : public ITable
{
public:
    AdminGroupTable(QSqlDatabase database);

    enum Commands{
        Insert = Qt::UserRole,
        Update,
        Delete,
    };

private:
    void updateTable();
    QString getGroupId(int index);

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

#endif // ADMINGROUPTABLE_H
