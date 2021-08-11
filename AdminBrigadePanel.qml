import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property alias brigadeEdit: _brigadeNameEdit;
    property alias objectEdit: _objectEdit;
    property alias leaderEdit: _leaderEdit;

    property bool rowSelected: false;

    signal addPressed();
    signal removePressed();
    signal changePressed();

    id: brigades
    Text{
        id: _brigadeName
        anchors.top: brigades.top;
        anchors.left: brigades.left;
        anchors.right: brigades.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigades.horizontalCenter
        text: "Название бригады"
        font.pointSize: 14
    }
    TextField{
        id: _brigadeNameEdit
        anchors.top: _brigadeName.bottom;
        anchors.left: brigades.left;
        anchors.right: brigades.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigades.horizontalCenter

    }
    Text{
        id: _object
        anchors.top: _brigadeNameEdit.bottom;
        anchors.left: brigades.left;
        anchors.right: brigades.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigades.horizontalCenter
        text: "Имя объекта"
        font.pointSize: 14
    }
    ComboBox{
        id: _objectEdit
        anchors.top: _object.bottom;
        anchors.left: brigades.left;
        anchors.right: brigades.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigades.horizontalCenter

        model: [];
    }
    Text{
        id: _leader
        anchors.top: _objectEdit.bottom;
        anchors.left: brigades.left;
        anchors.right: brigades.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigades.horizontalCenter
        text: "Лидирующая группа"
        font.pointSize: 14
    }
    ComboBox {
        id: _leaderEdit
        anchors.top: _leader.bottom;
        anchors.left: brigades.left;
        anchors.right: brigades.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigades.horizontalCenter

        model: [];
    }
    SimpleButton{
        id: _addButton;
        anchors.top: _leaderEdit.bottom;
        anchors.left: brigades.left;
        anchors.right: brigades.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigades.horizontalCenter

        enabled: _brigadeNameEdit.length != 0;



        buttonText: "Добавить";
        idleColor:  enabled? "#83aae5" : "#5A759C";

        onClicked: {
            addPressed();
        }
    }
    SimpleButton{
        id: _removeButton;
        anchors.top: _addButton.bottom;
        anchors.left: brigades.left;
        anchors.right: brigades.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigades.horizontalCenter

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
        anchors.left: brigades.left;
        anchors.right: brigades.right;
        anchors.margins: 10;
        anchors.horizontalCenter: brigades.horizontalCenter

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
