import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: _root;
    property color mainColor: "#83aae5"
    property color backgroundColor: "white";

    property alias tableView: _tableView
    property alias _students: students
    property alias stack: _stack

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
            text: qsTr("Студенты")
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
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
                _tableView.currentRow = -1
                students.groupEdit.model = tableModel.select(259);
                _stack.width = 200;
            }
        }
        TabButton {
            text: qsTr("Бригады")
            background: Rectangle{
                color: bar.currentIndex == 1 ? "#badbff" : "#5A759C";//"#83aae5";
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
                backend.open(257);
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
                _tableView.currentRow = -1
                brigades.objectEdit.model = tableModel.select(259);
                brigades.leaderEdit.model = tableModel.select(260);
                _stack.width = 200;
            }
        }
        TabButton {
            text: qsTr("Группы")
            background: Rectangle{
                color: bar.currentIndex == 2 ? "#badbff" : "#5A759C";//"#83aae5";
            }
            onClicked: {
                backend.open(258);
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
                _tableView.currentRow = -1
                _stack.width = 200;
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
                payments.studentEdit.model = tableModel.select(259);
                _stack.width = 200;
            }
            background: Rectangle{
                color: bar.currentIndex == 3 ? "#badbff" : "#5A759C";//"#83aae5";
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
            text: qsTr("Бригады-Студенты")
            onClicked: {
                backend.open(260);
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
                _tableView.currentRow = -1
                brigStuds.studentEdit.model = tableModel.select(259);
                brigStuds.brigadeEdit.model = tableModel.select(260);
                _stack.width = 200;
            }
            background: Rectangle{
                color: bar.currentIndex == 4 ? "#badbff" : "#5A759C";//"#83aae5";
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
        TabButton {
            text: qsTr("Объекты")
            onClicked: {
                backend.open(261);
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
                _tableView.currentRow = -1
                _stack.width = 200;
            }
            background: Rectangle{
                color: bar.currentIndex == 5 ? "#badbff" : "#5A759C";//"#83aae5";
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
            text: qsTr("Задание 2")
            onClicked: {
                backend.open(262);
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
                _tableView.currentRow = -1
                _stack.width = 300;
            }
            background: Rectangle{
                color: bar.currentIndex == 6 ? "#badbff" : "#5A759C";//"#83aae5";
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
            text: qsTr("Представление")
            onClicked: {
                backend.open(263);
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
                _tableView.currentRow = -1
                _stack.width = 0;
            }
            background: Rectangle{
                color: bar.currentIndex == 7 ? "#badbff" : "#5A759C";//"#83aae5";
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
    }

    NormalTableView{
        id: _tableView
        anchors.top: bar.bottom;
        anchors.left: parent.left;
        anchors.right: _stack.left;
        anchors.bottom: parent.bottom;
    }

    StackLayout {
        id: _stack
        anchors.top: bar.bottom;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        width: 200;
        currentIndex: bar.currentIndex
        AdminStudentPanel {
            id: students
            function clickHandler(){
                    if(visible){
                        studentEdit.text = tableModel.data(tableModel.index(_tableView.currentRow,0));
                        courseEdit.text = tableModel.data(tableModel.index(_tableView.currentRow,1));
                        groupEdit.currentIndex = groupEdit.find(qsTr(tableModel.data(tableModel.index(_tableView.currentRow,2))));
                    }
            }

            rowSelected: _tableView.currentRow != -1;

            Component.onCompleted: {
                _tableView.rowClicked.connect(clickHandler)
            }

            onAddPressed: {
                let arr = [_tableView.currentRow,studentEdit.text,courseEdit.text, groupEdit.displayText]
                console.log(tableModel.execute(256, arr));
            }

            onChangePressed: {
                let arr = [_tableView.currentRow,studentEdit.text,courseEdit.text, groupEdit.displayText]
                console.log(tableModel.execute(257,arr));
            }
            onRemovePressed: {
                let arr = [_tableView.currentRow,studentEdit.text,courseEdit.text, groupEdit.displayText]
                console.log(tableModel.execute(258,arr));
            }
        }
        AdminBrigadePanel {
            id: brigades
            function clickHandler(){
                    if(visible){
                    brigadeEdit.text = tableModel.data(tableModel.index(_tableView.currentRow,0));
                    objectEdit.currentIndex = objectEdit.find(qsTr(tableModel.data(tableModel.index(_tableView.currentRow,1))));
                    leaderEdit.currentIndex = leaderEdit.find(qsTr(tableModel.data(tableModel.index(_tableView.currentRow,3))));
                    }
            }

            rowSelected: _tableView.currentRow != -1;

            Component.onCompleted: {
                _tableView.rowClicked.connect(clickHandler)
            }

            onAddPressed: {
                let arr = [_tableView.currentRow,brigadeEdit.text,objectEdit.displayText, leaderEdit.displayText]
                console.log(tableModel.execute(256, arr));
            }

            onChangePressed: {
                let arr = [_tableView.currentRow,brigadeEdit.text,objectEdit.displayText, leaderEdit.displayText]
                console.log(tableModel.execute(257,arr));
            }
            onRemovePressed: {
                let arr = [_tableView.currentRow,brigadeEdit.text,objectEdit.displayText, leaderEdit.displayText]
                console.log(tableModel.execute(258,arr));
            }
        }
        AdminGroupPanel {
            id: groups
            function clickHandler(){
                    if(visible){
                    groupEdit.text = tableModel.data(tableModel.index(_tableView.currentRow,0));
                    }
            }

            rowSelected: _tableView.currentRow != -1;

            Component.onCompleted: {
                _tableView.rowClicked.connect(clickHandler)
            }

            onAddPressed: {
                let arr = [_tableView.currentRow,groupEdit.text]
                console.log(tableModel.execute(256, arr));
            }

            onChangePressed: {
                let arr = [_tableView.currentRow,groupEdit.text]
                console.log(tableModel.execute(257,arr));
            }
            onRemovePressed: {
                let arr = [_tableView.currentRow,groupEdit.text]
                console.log(tableModel.execute(258,arr));
            }
        }
        AdminPaymentPanel {
            id: payments
            function clickHandler(){
                    if(visible){
                    studentEdit.currentIndex = studentEdit.find(qsTr(tableModel.data(tableModel.index(_tableView.currentRow,0))));
                    amountWorkEdit.text = tableModel.data(tableModel.index(_tableView.currentRow,2));
                    kindWorkEdit.text = tableModel.data(tableModel.index(_tableView.currentRow,3));
                    paymentEdit.text = tableModel.data(tableModel.index(_tableView.currentRow,4));
                    }
            }

            rowSelected: _tableView.currentRow != -1;

            Component.onCompleted: {
                _tableView.rowClicked.connect(clickHandler)
            }

            onAddPressed: {
                let arr = [_tableView.currentRow,studentEdit.displayText,amountWorkEdit.text, kindWorkEdit.text,paymentEdit.text]
                console.log(tableModel.execute(256, arr));
            }

            onChangePressed: {
                let arr = [_tableView.currentRow,studentEdit.displayText,amountWorkEdit.text, kindWorkEdit.text,paymentEdit.text]
                console.log(tableModel.execute(257,arr));
            }
            onRemovePressed: {
                let arr = [_tableView.currentRow,studentEdit.displayText,amountWorkEdit.text, kindWorkEdit.text,paymentEdit.text]
                console.log(tableModel.execute(258,arr));
            }
        }
        AdminBrigStudPanel {
            id: brigStuds

            rowSelected: _tableView.currentRow != -1;

            onAddPressed: {
                let arr = [_tableView.currentRow,studentEdit.displayText,brigadeEdit.displayText]
                if(!tableModel.execute(256, arr)){
                    let warning = Qt.createQmlObject("Warning {}", _root);
                    warning.x = _root.width/2 - warning.width/2;
                    warning.y = _root.height/2 - warning.height/2;
                    warning.title = "Ошибка";
                    warning.warningText = "Студент уже состоит в этой бригаде";
                    warning.visible = true;
                }

            }
            onRemovePressed: {
                let arr = [_tableView.currentRow,studentEdit.displayText,brigadeEdit.displayText]
                console.log(tableModel.execute(258,arr));
            }
        }
        AdminObjectPanel {
            id: objects
            function clickHandler(){
                    if(visible){
                        objectEdit.text = tableModel.data(tableModel.index(_tableView.currentRow,0));
                        locationEdit.text = tableModel.data(tableModel.index(_tableView.currentRow,1));
                    }
            }

            rowSelected: _tableView.currentRow != -1;

            Component.onCompleted: {
                _tableView.rowClicked.connect(clickHandler)
            }

            onAddPressed: {
                let arr = [_tableView.currentRow,objectEdit.text, locationEdit.text]
                console.log(tableModel.execute(256, arr));
            }

            onChangePressed: {
                let arr = [_tableView.currentRow,objectEdit.text, locationEdit.text]
                console.log(tableModel.execute(257,arr));
            }
            onRemovePressed: {
                let arr = [_tableView.currentRow,objectEdit.text, locationEdit.text]
                console.log(tableModel.execute(258,arr));
            }
        }
        AdminTaskPanel {
            id: tasks

            onSecond2APressed: {
                console.log(tableModel.execute(256,[]))
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
            }

            onSecond2BPressed: {
                console.log(tableModel.execute(257,[]))
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
            }

            onSecond2CSelectNoCorPressed: {
                console.log(tableModel.execute(258,[]))
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
            }

            onSecond2CSelectCorPressed: {
                console.log(tableModel.execute(259,[]))
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
            }

            onSecond2CFromNoCorPressed: {
                console.log(tableModel.execute(260,[]))
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
            }

            onSecond2CFromCorPressed: {
                console.log(tableModel.execute(261,[]))
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
            }

            onSecond2CWhereNoCorAndAnyPressed: {
                console.log(tableModel.execute(262,[]))
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
            }

            onSecond2CWhereCorPressed: {
                console.log(tableModel.execute(263,[]))
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
            }

            onSecond2DHavingPressed: {
                console.log(tableModel.execute(264,[]))
                _tableView.rep.model = 0;
                _tableView.rep.model = tableModel.columnCount();
            }
        }
    }
}
