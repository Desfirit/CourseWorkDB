#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include <QSqlQueryModel>

#include "admintasktable.h"

AdminTaskTable::AdminTaskTable(QSqlDatabase database)
{
    _database = database;
}

int AdminTaskTable::rowCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->rowCount(parent);
}

int AdminTaskTable::columnCount(const QModelIndex &parent) const
{
    if(!_table)
        return 0;

    return _table->columnCount(parent);
}

QVariant AdminTaskTable::data(const QModelIndex &index, int role) const
{
    if(!_table)
        return QVariant();

    return _table->data(index,role);

}

QVariant AdminTaskTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(!_table)
        return QVariant();

    return _table->headerData(section,orientation,role);
}

QVariantList AdminTaskTable::select(int command)
{
    return QVariantList();
}

bool AdminTaskTable::execute(int command, QVector<QString> params)
{
    if(!_table)
        return false;

    QSqlQuery procedureQuery(_database);
    QString query;
    bool res;
    switch (command) {
        case Commands::SecondA:
        {
            query = QString("SELECT s.name,"
                            "g.name,"
                            "o.name,"
                            "CASE WHEN is_current THEN 'текущая бригада' "
                                 "ELSE 'прошлая бригада' "
                            "END "
                            "FROM "
                            " brigades JOIN brig_stud ON brigades.brigade_pk = brig_stud.brigade_fk "
                            " JOIN students s ON brig_stud.student_fk = s.student_pk "
                            " JOIN groups g on s.group_fk = g.group_pk "
                            " JOIN objects o on brigades.object_fk = o.object_id; ");
            break;
        }

        case Commands::SecondB:
        {
            query = QString("SELECT * "
                            "FROM brig_stud_view "
                            "WHERE state = 'текущая бригада' ");
            break;
        }
        case Commands::SecondCSelectNoCor:
        {
            query = QString("SELECT students.name, (SELECT groups.name FROM groups WHERE groups.name = 'БСБО-01-19' )"
                            " FROM students "
                            " WHERE students.group_fk IN ("
                                "SELECT groups.group_pk "
                                " FROM groups "
                                " WHERE groups.name = 'БСБО-01-19'"
                            ");");
            break;
        }
        case Commands::SecondCSelectCor:
        {
            query = QString("SELECT groups.name, (SELECT COUNT(*) FROM students WHERE students.group_fk = groups.group_pk) "
                            "FROM groups;");
            break;
        }
        case Commands::SecondCFromNoCor:
        {
            query = QString("SELECT * FROM students, (SELECT * FROM brigades, brig_stud WHERE brigades.brigade_pk = brig_stud.brigade_fk) as un "
                            "WHERE students.student_pk = un.student_fk;");
            break;
        }
        case Commands::SecondCFromCor:
        {
            query = QString("SELECT res.name, groups.name  FROM groups, LATERAL (SELECT students.name, students.group_fk "
                            "FROM students "
                            "WHERE students.group_fk = groups.group_pk "
                            ") as res WHERE res.group_fk = groups.group_pk;");
            break;
        }
        case Commands::SecondCWhereNoCorAndAny:
        {
            query = QString("SELECT students.name, students.course "
                            "FROM students "
                            "WHERE students.group_fk = ANY ("
                                "SELECT groups.group_pk "
                                "FROM groups "
                                "WHERE groups.name = 'БСБО-01-19'"
                            ");");
            break;
        }
        case Commands::SecondCWhereCor:
        {
            query = QString("SELECT students.name "
                            "FROM students "
                            "WHERE EXISTS("
                                "SELECT * "
                                "FROM brig_stud "
                                "WHERE students.student_pk = brig_stud.student_fk"
                            ");");
            break;
        }
        case Commands::SecondDHaving:
        {
            query = QString("SELECT g.name, "
                            "COUNT(*) "
                             "FROM "
                                  "brigades JOIN brig_stud ON brigades.brigade_pk = brig_stud.brigade_fk "
                                  "JOIN students s ON brig_stud.student_fk = s.student_pk "
                                  "JOIN groups g on s.group_fk = g.group_pk "
                             "GROUP BY g.name "
                             "HAVING COUNT(*) > 2 ");
            break;
        }
    }
    res = procedureQuery.exec(query);
    if(res)
        _table->setQuery(procedureQuery);
    else
        qDebug() << procedureQuery.lastError();
    return res;
}

bool AdminTaskTable::open()
{
    _table = new QSqlQueryModel();
    return true;
}
