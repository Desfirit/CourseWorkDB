#ifndef ADMINPAYMENTMODEL_H
#define ADMINPAYMENTMODEL_H

#include <QtSql/QSqlDatabase>

#include "itable.h"

class AdminPaymentTable : public ITable
{
public:
    AdminPaymentTable(QSqlDatabase database);

    enum Commands{
        Insert = Qt::UserRole,
        Update,
        Delete,
        GetWorkingStudents,
    };



private:
    void updateTable();
    QString getWorkId(int index);

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

#endif // ADMINPAYMENTMODEL_H
