#ifndef ADMINTASKTABLE_H
#define ADMINTASKTABLE_H

#include <QtSql/QSqlDatabase>

#include "itable.h"

class AdminTaskTable : public ITable
{
public:
    AdminTaskTable(QSqlDatabase database);

    enum Commands{
        SecondA = Qt::UserRole,
        SecondB,
        SecondCSelectNoCor,
        SecondCSelectCor,
        SecondCFromNoCor,
        SecondCFromCor,
        SecondCWhereNoCorAndAny,
        SecondCWhereCor,
        SecondDHaving,
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

#endif // ADMINTASKTABLE_H
