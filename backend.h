#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QAbstractTableModel>
#include <QtSql/QSqlDatabase>

#include "mytablemodel.h"
#include "user.h"

class Backend : public QObject
{
    Q_OBJECT
public:
    explicit Backend(QObject *parent = nullptr);

Q_INVOKABLE QString validateUser(QString login, QString password);
Q_INVOKABLE void open(int table);

    MyTableModel* getTableModel();


signals:


private:

    MyTableModel* _tableModel;
    User* _currentUser;
};

#endif // BACKEND_H
