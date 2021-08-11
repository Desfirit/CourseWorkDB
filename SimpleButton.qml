import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Button{
    property string buttonText: "value"
    property color idleColor: "#83aae5"

    property alias labelEdit: _text;

    id: _logInButton;

    width: 180;
    height: 40;

    text: buttonText;

    contentItem: Label {
        id: _text
        anchors.centerIn: parent;
        text: parent.text;
        color: "white"
        font.family: parent.font;
        font.pointSize:9;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
    }
    background: Rectangle{
        anchors.fill: parent;
        color: parent.down? "#5eb9ff" : idleColor;
        border.color: "gray";
    }
}
