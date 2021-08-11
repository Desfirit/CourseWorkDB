#ifndef STUDENTPREVIOUSBRIGADETABLE_H
#define STUDENTPREVIOUSBRIGADETABLE_H

#include <QtSql/QSqlDatabase>

#include "itable.h"

class StudentPreviousBrigadeTable : public ITable
{
public:
    StudentPreviousBrigadeTable(QSqlDatabase database);


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

#endif // STUDENTPREVIOUSBRIGADETABLE_H
