import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Dialog {
    id: _root;

    width: 200;
    height: 140;

    property string warningText: "Неизвестная ошибка";

    standardButtons: Dialog.Ok;

    Label{
        text: warningText;
    }

    onAccepted: {
        _root.destroy();
    }
    onRejected: {
        _root.destroy();
    }
}
