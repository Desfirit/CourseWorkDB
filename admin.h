#ifndef ADMIN_H
#define ADMIN_H
#include <QtSql/QSqlDatabase>
#include <QAbstractTableModel>

#include "user.h"

class Admin: public User
{
public:
    Admin();
    explicit Admin(QSqlDatabase db);

    enum Tables{
        Students = Qt::UserRole,
        Brigades,
        Groups,
        Payments,
        BrigStud,
        Objects,
        Task2,
        View,
    };

private:

    // User interface
public:
    ITable* open(int table);

};

#endif // ADMIN_H
