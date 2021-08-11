import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property alias studentEdit: _studentNameEdit;
    property alias brigadeEdit: _brigadeNameEdit;

    property bool rowSelected: false;

    signal addPressed();
    signal removePressed();

    id: brigStuds
    Text{
        id: _studentName;
        anchors.top: brigStuds.top;
        anchors.left: brigStuds.left;
        anchors.right: brigStuds.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigStuds.horizontalCenter
        text: "Название бригады"
        font.pointSize: 14
    }
    ComboBox{
        id: _studentNameEdit;
        anchors.top: _studentName.bottom;
        anchors.left: brigStuds.left;
        anchors.right: brigStuds.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigStuds.horizontalCenter

        model: [];
    }
    Text{
        id: _brigadeName
        anchors.top: _studentNameEdit.bottom;
        anchors.left: brigStuds.left;
        anchors.right: brigStuds.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigStuds.horizontalCenter
        text: "Имя объекта"
        font.pointSize: 14
    }
    ComboBox{
        id: _brigadeNameEdit
        anchors.top: _brigadeName.bottom;
        anchors.left: brigStuds.left;
        anchors.right: brigStuds.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigStuds.horizontalCenter

        model: [];
    }
    SimpleButton{
        id: _addButton;
        anchors.top: _brigadeNameEdit.bottom;
        anchors.left: brigStuds.left;
        anchors.right: brigStuds.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigStuds.horizontalCenter

        enabled: true;



        buttonText: "Добавить";
        idleColor:  enabled? "#83aae5" : "#5A759C";

        onClicked: {
            addPressed();
        }
    }
    SimpleButton{
        id: _removeButton;
        anchors.top: _addButton.bottom;
        anchors.left: brigStuds.left;
        anchors.right: brigStuds.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigStuds.horizontalCenter

        enabled: rowSelected;

        buttonText: "Удалить";
        idleColor: enabled? "#83aae5" : "#5A759C";

        onClicked: {
            removePressed();
        }
    }

    Rectangle{
        anchors.fill: parent;
        z: -1;
    }
}
