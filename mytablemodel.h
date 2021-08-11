#ifndef MYTABLEMODEL_H
#define MYTABLEMODEL_H

#include <QAbstractTableModel>

#include "itable.h"

class MyTableModel : public QAbstractTableModel
{
    Q_OBJECT
public:
    MyTableModel(QObject* parent = nullptr);

    void setTableModel(ITable* model);
    Q_INVOKABLE bool execute(int command, QVector<QString> params);
    Q_INVOKABLE QVariantList select(int command);

private:
    ITable* _tableModel = nullptr;

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const;
    int columnCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QVariant headerData(int section, Qt::Orientation orientation, int role) const;

};

#endif // MYTABLEMODEL_H
