import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Page {
    id: _root;
    property color mainColor: "#83aae5"
    property color backgroundColor: "white";
    property string buttonText: "Войти";
    property string warningText: "";

    signal loginButtonClicked(string login, string password);

    background: Rectangle{
        id: _backgroundRect;
        color: backgroundColor;
    }

    Rectangle{
        id: _header;
        color: mainColor;
        anchors.left: parent.left;
        anchors.right: parent.right;
        width: 640;
        height: 60;

        Label{
            anchors.centerIn: _header;
            text: "Авторизация"
            color: "#d8e5f1";
            font.family: "Arial";
            font.pointSize: 16;
        }
    }

    Item {
        id: _someText;
        anchors.top: _header.bottom;
        anchors.topMargin: 40;
        anchors.horizontalCenter: parent.horizontalCenter;
        //x: 147;
        //y: 100;
        width: 345;
        height: 100;

        Label{
            anchors.top: _someText.top;
            anchors.left: _someText.left;
            anchors.right: _someText.right;

            text: "Введите логин и пароль"
            font.family: "San Francisco Pro Text";
            font.pointSize: 16;
            horizontalAlignment: Text.AlignHCenter;
        }

        Text{
            anchors.bottom: _someText.bottom;
            anchors.left: _someText.left;
            anchors.right: _someText.right;
            text: "Если вы не знаете своего логина и пароля - просьба обратиться к администратору"
            font.family: "San Francisco Pro Text";
            font.pointSize: 13;
            horizontalAlignment: Text.AlignHCenter;
            color: "#687089";
            wrapMode: Text.Wrap;
        }
    }

    Label{
        id: warning;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: _login.top;
        anchors.bottomMargin: 10;
        //y: 229;

        text: warningText;
        font.family: "Arial";
        font.pointSize: 13;
        color: "#ff294d";
    }

    TextField{
        id: _login;
        anchors.horizontalCenter: parent.horizontalCenter;
        //x: 147
        anchors.top: _someText.bottom;
        anchors.topMargin: 50;
        //y: 250
        width: 345;
        height: 50;
        font.pointSize: 13;
        placeholderText: "Login"
        onAccepted: {
            if(_password.text != "")
                loginButtonClicked(_login.text, _password.text);
            else
                _password.focus = true;
        }
    }
    TextField{
        id: _password;
        anchors.horizontalCenter: parent.horizontalCenter;
        //x: 147
        anchors.top: _login.bottom;
        anchors.topMargin: 5
        //y: 305
        width: 345;
        height: 50;
        font.pointSize: 13;
        placeholderText: "Password";
        echoMode: TextInput.Password;
        onAccepted: {
            if(_login.text != "")
                loginButtonClicked(_login.text, _password.text);
        }
    }

    Button{
        id: _logInButton;
        anchors.horizontalCenter: parent.horizontalCenter;
        //x: 230;
        anchors.top: _password.bottom;
        anchors.topMargin: 40
        //y: 395;

        width: 180;
        height: 40;

        text: "Войти";

        contentItem: Label {
                anchors.centerIn: parent;
                text: parent.text;
                color: "white"
                font.family: parent.font;
                font.pointSize:14;
                horizontalAlignment: Text.AlignHCenter;
        }
        background: Rectangle{
            anchors.fill: parent;
            color: parent.down? "#5eb9ff" : "#2e8def";
        }

        onClicked: {
            loginButtonClicked(_login.text, _password.text);
        }
    }
}
