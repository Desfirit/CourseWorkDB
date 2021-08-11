import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Item {
    id: _root;

    property string fioText: "Имя студента"
    property string groupNameText: "Название группы"
    property string courseText: "Курс"
    property string brigadeNameText: "Название бригады"
    property string peopleCountText: "Количество людей"
    property string objectNameText: "Название объекта"
    property string locationText: "Адрес"

    Rectangle{
        anchors.fill: _profile
        color: "white";
    }

    Item {
        id: _studentInfo
        //anchors.top: _root.top;
        anchors.bottom: _brigadeInfo.top
        anchors.bottomMargin: 40;

        anchors.horizontalCenter: _root.horizontalCenter;
        //anchors.left: _root.left
        //anchors.leftMargin: 50;
        //anchors.right: _root.right
        //anchors.rightMargin: 50;


        width: _root.width * 0.7;
        height: _root.height * 0.2;




        Image{
            id: _icon1
            anchors.verticalCenter: _studentInfo.verticalCenter;
            anchors.left: parent.left;

            width: 140
            height: 125
            source: "Images/profile.svg"
            ColorOverlay {
                    anchors.fill: _icon1
                    source: _icon1
                    color: "#cbdeff";
            }
        }

        Text{
            id: _fio;
            anchors.left: _icon1.right;
            anchors.top: parent.top;
            anchors.margins: 10;
            font.pointSize: 14;

            text: "Имя студента: " + fioText;
        }
        Text{
            id: _group;
            anchors.left: _icon1.right;
            anchors.top: _fio.bottom;
            anchors.margins: 10;
            font.pointSize: 14;

            text: "Название группы: " + groupNameText;

        }
        Text{
            id: _course;
            anchors.left: _icon1.right;
            anchors.top: _group.bottom;
            anchors.margins: 10;
            font.pointSize: 14;

            text: "Курс: " + courseText;

        }
    }

    Label{
        anchors.bottom: _brigadeInfo.top;
        anchors.bottomMargin: 10;
        anchors.left: _brigadeInfo.left
        text: "Бригада"
        font.family: "Arial";
        font.pointSize: 16;
    }

    Item {
        id: _brigadeInfo
        anchors.centerIn: parent
        //anchors.topMargin: 10
        //anchors.horizontalCenter: _root.horizontalCenter;
        //anchors.left: _root.left
        //anchors.leftMargin: 50;
        //anchors.right: _root.right
        //anchors.rightMargin: 50;*/
        anchors.margins: 20

        width: _root.width * 0.7;
        height: _root.height * 0.2;



        Image{
            id: _icon2
            anchors.verticalCenter: _brigadeInfo.verticalCenter;
            anchors.left: parent.left;

            width: 90
            height: 90



            anchors.margins: 10;
            source: "Images/brigade.svg"
            ColorOverlay {
                    anchors.fill: _icon2
                    source: _icon2
                    color: "#cbdeff";
            }
        }

        Text{
            id: _brigadeName;
            anchors.left: _icon2.right;
            anchors.top: parent.top;
            anchors.margins: 10;
            font.pointSize: 14;

            text: "Название бригады: " + brigadeNameText;
        }
        Text{
            id: _peopleCount;
            anchors.left: _icon2.right;
            anchors.top: _brigadeName.bottom;
            anchors.margins: 10;
            font.pointSize: 14;

            text: "Количество людей: " + peopleCountText;

        }
    }

    Label{
        anchors.bottom: _objectInfo.top;
        anchors.bottomMargin: 10;
        anchors.left: _objectInfo.left
        text: "Объект"
        font.family: "Arial";
        font.pointSize: 16;
    }

    Item {
        id: _objectInfo
        anchors.top: _brigadeInfo.bottom;
        //anchors.topMargin: 10
        anchors.horizontalCenter: _root.horizontalCenter;
        //anchors.left: _root.left
        //anchors.leftMargin: 50;
        //anchors.right: _root.right
        //anchors.rightMargin: 50;*/
        anchors.topMargin: 40



        width: _root.width * 0.7;
        height: _root.height * 0.2;




        Image{
            id: _icon3
            anchors.verticalCenter: _objectInfo.verticalCenter;
            anchors.left: parent.left;

            width: 77
            height: 90
            source: "Images/building.svg"
            ColorOverlay {
                    anchors.fill: _icon3
                    source: _icon3
                    color: "#cbdeff";
            }
        }

        Text{
            id: _objectName;
            anchors.left: _icon3.right;
            anchors.top: parent.top;
            anchors.margins: 10;
            font.pointSize: 14;

            text: "Название объекта: " + objectNameText;
        }
        Text{
            id: _location;
            anchors.left: _icon3.right;
            anchors.top: _objectName.bottom;
            anchors.margins: 10;
            font.pointSize: 14;

            text: "Адрес: " + locationText;

        }
    }
}
