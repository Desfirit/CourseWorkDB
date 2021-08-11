import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property alias groupEdit: _groupEdit;

    property bool rowSelected: false;

    signal addPressed();
    signal removePressed();
    signal changePressed();

    id: groups
    Text{
        id: _group
        anchors.top: groups.top;
        anchors.left: groups.left;
        anchors.right: groups.right;
        anchors.margins: 10;
        anchors.horizontalCenter: groups.horizontalCenter
        text: "Название группы"
        font.pointSize: 14
    }
    TextField{
        id: _groupEdit
        anchors.top: _group.bottom;
        anchors.left: groups.left;
        anchors.right: groups.right;
        anchors.margins: 10;
        anchors.horizontalCenter: groups.horizontalCenter

        inputMask: ">AAAA-99-99";
        inputMethodHints: Qt.ImhPreferUppercase;

    }
    SimpleButton{
        id: _addButton;
        anchors.top: _groupEdit.bottom;
        anchors.left: groups.left;
        anchors.right: groups.right;
        anchors.margins: 10;
        anchors.horizontalCenter: groups.horizontalCenter

        enabled: _groupEdit.text.length == 10;

        buttonText: "Добавить";
        idleColor:  enabled? "#83aae5" : "#5A759C";

        onClicked: {
            addPressed();
        }
    }
    SimpleButton{
        id: _removeButton;
        anchors.top: _addButton.bottom;
        anchors.left: groups.left;
        anchors.right: groups.right;
        anchors.margins: 10;
        anchors.horizontalCenter: groups.horizontalCenter

        enabled: rowSelected;

        buttonText: "Удалить";
        idleColor: enabled? "#83aae5" : "#5A759C";

        onClicked: {
            removePressed();
        }
    }
    SimpleButton{
        id: _updateButton;
        anchors.top: _removeButton.bottom;
        anchors.left: groups.left;
        anchors.right: groups.right;
        anchors.margins: 10;
        anchors.horizontalCenter: groups.horizontalCenter

        enabled: rowSelected && _addButton.enabled;

        buttonText: "Изменить";
        idleColor: enabled? "#83aae5" : "#5A759C";
        onClicked: {
            changePressed();
        }
    }

    Rectangle{
        anchors.fill: parent;
        z: -1;
    }
}
