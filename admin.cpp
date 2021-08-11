#include <QPair>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QSqlQueryModel>

#include "admin.h"
#include "adminstudenttable.h"
#include "adminbrigadetable.h"
#include "admingrouptable.h"
#include "adminpaymenttable.h"
#include "adminbrigstudtable.h"
#include "adminobjecttable.h"
#include "adminviewtable.h"
#include "admintasktable.h"


Admin::Admin()
{

}

Admin::Admin(QSqlDatabase db): User(db)
{
}

ITable *Admin::open(int table)
{

    ITable* relation;

    switch (table) {
         case Tables::Students:
             relation = new AdminStudentTable(_db);
             break;
         case Tables::Brigades:
            relation = new AdminBrigadeTable(_db);
            break;
         case Tables::Groups:
            relation = new AdminGroupTable(_db);
            break;
        case Tables::Payments:
            relation = new AdminPaymentTable(_db);
            break;
        case Tables::BrigStud:
            relation = new AdminBrigStudTable(_db);
            break;
        case Tables::Objects:
            relation = new AdminObjectTable(_db);
            break;
        case Tables::Task2:
            relation = new AdminTaskTable(_db);
            break;
        case Tables::View:
            relation = new AdminViewTable(_db);
            break;
        default:
            return nullptr;
    }

    if(relation->open())
        return relation;
    else
        return nullptr;

}
