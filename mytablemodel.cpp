#include <QDebug>

#include "mytablemodel.h"


MyTableModel::MyTableModel(QObject *parent): QAbstractTableModel(parent)
{

}

void MyTableModel::setTableModel(ITable *model)
{
    beginResetModel();
    delete _tableModel;
    _tableModel = model;
    endResetModel();
}

bool MyTableModel::execute(int command, QVector<QString> params)
{
    bool res;
    beginResetModel();
    res = _tableModel->execute(command,params);
    endResetModel();
    return res;
}

QVariantList MyTableModel::select(int command)
{
    return _tableModel->select(command);
}


int MyTableModel::rowCount(const QModelIndex &parent) const
{

    if(_tableModel)
        return _tableModel->rowCount(parent);
    else
        return 0;
}

int MyTableModel::columnCount(const QModelIndex &parent) const
{
    if(_tableModel)
        return _tableModel->columnCount(parent);
    else
        return 0;
}

QVariant MyTableModel::data(const QModelIndex &index, int role) const
{
    if(_tableModel)
        return _tableModel->data(index,role);
    else
        return QVariant();
}


QVariant MyTableModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(_tableModel)
    {
        return _tableModel->headerData(section,orientation,role);
    }
    else
        return QVariant();
}
