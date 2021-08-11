#include <QDebug>
#include <QAbstractTableModel>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>

#include "backend.h"
#include "admin.h"
#include "student.h"
#include "mytablemodel.h"


Backend::Backend(QObject *parent) : QObject(parent)
{
    qDebug() << QSqlDatabase::drivers();
    _tableModel = new MyTableModel(this);
}

MyTableModel *Backend::getTableModel()
{
    return _tableModel;
}

QString Backend::validateUser(QString login, QString password)
{
    QSqlDatabase dataBase = QSqlDatabase::addDatabase("QPSQL");
    dataBase.setHostName("127.0.0.1");
    dataBase.setPort(5432);
    dataBase.setDatabaseName("postgres");
    dataBase.setUserName(login);
    dataBase.setPassword(password);

    if(dataBase.open())
    {
        auto role = dataBase.exec("SELECT current_role");
        role.next();
        qDebug() << role.value(0);
        if(role.value(0).toString() == "admin")
        {
            _currentUser = new Admin(dataBase);
            return "Admin";
        }
        else
        {
            _currentUser = new Student(dataBase);
            auto id = dataBase.exec("SELECT get_student_id_for_user()");
            id.next();
            if(!id.value(0).isNull())
                return "Student";
            else
                return "WrongInput";
        }
    }
    else
    {
        qDebug() << dataBase.lastError();
        switch (dataBase.lastError().type()) {
            case QSqlError::ConnectionError:
                return "FailedConnection";
            default:
                return "UnknownError";
        }
    }
    return "WrongInput";
}

void Backend::open(int table)
{
    ITable* tableModel = _currentUser->open(table);
    if(tableModel)
    {
        _tableModel->setTableModel(tableModel);
    }
}
