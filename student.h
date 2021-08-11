#ifndef STUDENT_H
#define STUDENT_H

#include "user.h"

class Student : public User
{
public:
    explicit Student(QSqlDatabase db);

    enum Tables{
        Profile = Qt::UserRole,
        SameObjectBrigades,
        PreviousBrigades,
        Payments,
    };

    // User interface
public:
    ITable *open(int table);
};

#endif // STUDENT_H
