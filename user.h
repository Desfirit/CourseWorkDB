#ifndef USER_H
#define USER_H

#include <QtSql/QSqlDatabase>

#include "itable.h"

class User
{
public:
    User();
    explicit User(QSqlDatabase db);

    virtual ITable* open(int table) = 0;

protected:
    QSqlDatabase _db;
};

#endif // USER_H
