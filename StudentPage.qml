import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: _root;
    property color mainColor: "#83aae5";
    property color backgroundColor: "white";

    property alias profile: _profile

    background: Rectangle{
        id: _backgroundRect;
        color: backgroundColor;
    }
    TabBar {
        id: bar
        width: parent.width

        contentHeight: 40;
        background: Rectangle {
                color: "#83aae5"
        }
        TabButton {
            text: qsTr("Профиль")
            background: Rectangle{
                color: bar.currentIndex == 0 ? "#badbff" :"#5A759C";//"#83aae5";
            }
            contentItem: Label {
                anchors.centerIn: parent;
                text: parent.text;
                color: "white"
                font.family: parent.font;
                font.pointSize:9;
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
            }
            onClicked: {
                backend.open(256);
                _profile.fioText = qsTr(tableModel.data(tableModel.index(0,0)));
                _profile.groupNameText = qsTr(tableModel.data(tableModel.index(0,2)));
                _profile.courseText = tableModel.data(tableModel.index(0,1));
                _profile.brigadeNameText = qsTr(tableModel.data(tableModel.index(0,3)));
                _profile.peopleCountText = tableModel.data(tableModel.index(0,4));
                _profile.objectNameText = qsTr(tableModel.data(tableModel.index(0,5)));
                _profile.locationText = qsTr(tableModel.data(tableModel.index(0,6)));
            }
        }
        TabButton {
            text: qsTr("Бригады текущего объекта")
            background: Rectangle{
                color: bar.currentIndex == 1 ? "#badbff" : "#5A759C";//"#83aae5";
            }
            onClicked: {
                backend.open(257);
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
                _tableView.currentRow = -1
            }
            contentItem: Label {
                anchors.centerIn: parent;
                text: parent.text;
                color: "white"
                font.family: parent.font;
                font.pointSize:9;
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
            }
        }
        TabButton {
            text: qsTr("Прошлые бригады")
            onClicked: {
                backend.open(258);
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
                _tableView.currentRow = -1
            }
            background: Rectangle{
                color: bar.currentIndex == 2 ? "#badbff" : "#5A759C";//"#83aae5";
            }
            contentItem: Label {
                anchors.centerIn: parent;
                text: parent.text;
                color: "white"
                font.family: parent.font;
                font.pointSize:9;
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
            }
        }
        TabButton {
            text: qsTr("Выплаты")
            onClicked: {
                backend.open(259);
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
                _tableView.currentRow = -1
            }
            background: Rectangle{
                color: bar.currentIndex == 3 ? "#badbff" : "#5A759C";//"#83aae5";
            }
            contentItem: Label {
                anchors.centerIn: parent;
                text: parent.text;
                color: "white"
                font.family: parent.font;
                font.pointSize:8;
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
            }
        }
    }

    NormalTableView{
        id: _tableView
        anchors.top: bar.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
    }

    StackLayout {
        id: _stack
        anchors.top: bar.bottom;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.left: parent.left
        currentIndex: bar.currentIndex
        StudenProfilePanel {
            id: _profile
        }
    }
}
