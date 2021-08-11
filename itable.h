#ifndef ITABLE_H
#define ITABLE_H

#include <QAbstractTableModel>
#include <QSqlQueryModel>

class ITable : public QAbstractTableModel
{
public:
    ITable(QObject* parent = nullptr);
    ~ITable();
    virtual bool execute(int command, QVector<QString> params) = 0;
    virtual QVariantList select(int command) = 0;
    virtual bool open() = 0;

protected:
    QSqlQueryModel* _table = nullptr;
    QSqlDatabase _database;
};

#endif // ITABLE_H
