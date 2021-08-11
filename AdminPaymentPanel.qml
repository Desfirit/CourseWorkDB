import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property alias studentEdit: _studentNameEdit;
    property alias amountWorkEdit: _amountWorkEdit;
    property alias kindWorkEdit: _kindWorkEdit;
    property alias paymentEdit: _paymentEdit;

    property bool rowSelected: false;

    signal addPressed();
    signal removePressed();
    signal changePressed();

    id: payments
    Text{
        id: _studentName
        anchors.top: payments.top;
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: payments.horizontalCenter
        text: "Имя студента"
        font.pointSize: 14
    }
    ComboBox{
        id: _studentNameEdit
        anchors.top: _studentName.bottom;
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: payments.horizontalCenter

        model: [];
    }
    Text{
        id: _amountWork
        anchors.top: _studentNameEdit.bottom;
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: payments.horizontalCenter
        text: "Количество работы"
        font.pointSize: 14
    }
    TextField{
        id: _amountWorkEdit
        anchors.top: _amountWork.bottom;
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter

    }
    Text{
        id: _kindWork
        anchors.top: _amountWorkEdit.bottom;
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: payments.horizontalCenter
        text: "Характер работы"
        font.pointSize: 14
    }
    TextField{
        id: _kindWorkEdit
        anchors.top: _kindWork.bottom;
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter

    }
    Text{
        id: _payment
        anchors.top: _kindWorkEdit.bottom;
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: payments.horizontalCenter
        text: "Выплата"
        font.pointSize: 14
    }
    TextField{
        id: _paymentEdit
        anchors.top: _payment.bottom;
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: students.horizontalCenter

        inputMask: "$000.00";
    }
    SimpleButton{
        id: _addButton;
        anchors.top: _paymentEdit.bottom;
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: payments.horizontalCenter

        enabled: _amountWorkEdit.length != 0 && _kindWorkEdit.length != 0 && paymentEdit.length != 0;



        buttonText: "Добавить";
        idleColor:  enabled? "#83aae5" : "#5A759C";

        onClicked: {
            addPressed();
        }
    }
    SimpleButton{
        id: _removeButton;
        anchors.top: _addButton.bottom;
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: payments.horizontalCenter

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
        anchors.left: payments.left;
        anchors.right: payments.right;
        anchors.margins: 10;
        anchors.horizontalCenter: payments.horizontalCenter

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
