import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property alias objectEdit: _objectNameEdit;
    property alias locationEdit: _locationEdit;

    property bool rowSelected: false;

    signal addPressed();
    signal removePressed();
    signal changePressed();

    id: objects
    Text{
        id: _objectName
        anchors.top: objects.top;
        anchors.left: objects.left;
        anchors.right: objects.right;
        anchors.margins: 10;
        anchors.horizontalCenter: objects.horizontalCenter
        text: "Название"
        font.pointSize: 14
    }
    TextField{
        id: _objectNameEdit
        anchors.top: _objectName.bottom;
        anchors.left: objects.left;
        anchors.right: objects.right;
        anchors.margins: 10;
        anchors.horizontalCenter: objects.horizontalCenter

    }
    Text{
        id: _location
        anchors.top: _objectNameEdit.bottom;
        anchors.left: objects.left;
        anchors.right: objects.right;
        anchors.margins: 10;
        anchors.horizontalCenter: objects.horizontalCenter
        text: "Расположение"
        font.pointSize: 14
    }
    TextField{
        id: _locationEdit
        anchors.top: _location.bottom;
        anchors.left: objects.left;
        anchors.right: objects.right;
        anchors.margins: 10;
        anchors.horizontalCenter: objects.horizontalCenter

    }
    SimpleButton{
        id: _addButton;
        anchors.top: _locationEdit.bottom;
        anchors.left: objects.left;
        anchors.right: objects.right;
        anchors.margins: 10;
        anchors.horizontalCenter: objects.horizontalCenter

        enabled: _objectNameEdit.length !=0 && _locationEdit.length != 0;

        buttonText: "Добавить";
        idleColor:  enabled? "#83aae5" : "#5A759C";

        onClicked: {
            addPressed();
        }
    }
    SimpleButton{
        id: _removeButton;
        anchors.top: _addButton.bottom;
        anchors.left: objects.left;
        anchors.right: objects.right;
        anchors.margins: 10;
        anchors.horizontalCenter: objects.horizontalCenter

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
        anchors.left: objects.left;
        anchors.right: objects.right;
        anchors.margins: 10;
        anchors.horizontalCenter: objects.horizontalCenter

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
