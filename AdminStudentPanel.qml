import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property alias studentEdit: _studentNameEdit;
    property alias courseEdit: _courseEdit;
    property alias groupEdit: _groupEdit;

    property bool rowSelected: false;

    signal addPressed();
    signal removePressed();
    signal changePressed();

    id: students
    Text{
        id: _studentName
        anchors.top: students.top;
        anchors.left: students.left;
        anchors.right: students.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter
        text: "Имя"
        font.pointSize: 14
    }
    TextField{
        id: _studentNameEdit
        anchors.top: _studentName.bottom;
        anchors.left: students.left;
        anchors.right: students.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter

    }
    Text{
        id: _course
        anchors.top: _studentNameEdit.bottom;
        anchors.left: students.left;
        anchors.right: students.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter
        text: "Курс"
        font.pointSize: 14
    }
    TextField{
        id: _courseEdit
        anchors.top: _course.bottom;
        anchors.left: students.left;
        anchors.right: students.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter
        inputMask: "D";

    }
    Text{
        id: _group
        anchors.top: _courseEdit.bottom;
        anchors.left: students.left;
        anchors.right: students.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter
        text: "Группа"
        font.pointSize: 14
    }
    ComboBox {
        id: _groupEdit
        anchors.top: _group.bottom;
        anchors.left: students.left;
        anchors.right: students.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter

        model: [];
         onAccepted: {
             if (find(editText) === -1)
                 model.append({text: editText})
         }
    }
    SimpleButton{
        id: _addButton;
        anchors.top: _groupEdit.bottom;
        anchors.left: students.left;
        anchors.right: students.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter

        enabled: _studentNameEdit.length != 0 && _courseEdit.text.length != 0;



        buttonText: "Добавить";
        idleColor:  enabled? "#83aae5" : "#5A759C";

        onClicked: {
            addPressed();
        }
    }
    SimpleButton{
        id: _removeButton;
        anchors.top: _addButton.bottom;
        anchors.left: students.left;
        anchors.right: students.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter

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
        anchors.left: students.left;
        anchors.right: students.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter

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
