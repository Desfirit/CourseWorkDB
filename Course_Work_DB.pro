QT += quick sql core

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        admin.cpp \
        adminbrigadetable.cpp \
        adminbrigstudtable.cpp \
        admingrouptable.cpp \
        adminobjecttable.cpp \
        adminpaymenttable.cpp \
        adminstudenttable.cpp \
        admintasktable.cpp \
        adminviewtable.cpp \
        backend.cpp \
        itable.cpp \
        main.cpp \
        mytablemodel.cpp \
        student.cpp \
        studentbrigadesameobjecttable.cpp \
        studentpaymenttable.cpp \
        studentpreviousbrigadetable.cpp \
        studentprofile.cpp \
        user.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    admin.h \
    adminbrigadetable.h \
    adminbrigstudtable.h \
    admingrouptable.h \
    adminobjecttable.h \
    adminpaymenttable.h \
    adminstudenttable.h \
    admintasktable.h \
    adminviewtable.h \
    backend.h \
    itable.h \
    mytablemodel.h \
    student.h \
    studentbrigadesameobjecttable.h \
    studentpaymenttable.h \
    studentpreviousbrigadetable.h \
    studentprofile.h \
    user.h
