#include "user.h"


User::User()
{

}

User::User(QSqlDatabase db)
{
    _db = db;
}
