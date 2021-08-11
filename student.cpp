#include "student.h"
#include "studentbrigadesameobjecttable.h"
#include "studentpreviousbrigadetable.h"
#include "studentpaymenttable.h"
#include "studentprofile.h"




Student::Student(QSqlDatabase db): User(db)
{

}

ITable *Student::open(int table)
{
    ITable* relation;

    switch (table) {
         case Tables::Profile:
             relation = new StudentProfile(_db);
             break;
         case Tables::SameObjectBrigades:
            relation = new StudentBrigadeSameObjectTable(_db);
            break;
        case Tables::PreviousBrigades:
            relation = new StudentPreviousBrigadeTable(_db);
            break;
        case Tables::Payments:
            relation = new StudentPaymentTable(_db);
            break;
        default:
            return nullptr;
    }

    if(relation->open())
        return relation;
    else
        return nullptr;
}
