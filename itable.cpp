#include "itable.h"

ITable::ITable(QObject *parent):QAbstractTableModel(parent)
{

}

ITable::~ITable()
{
    delete _table;
}
