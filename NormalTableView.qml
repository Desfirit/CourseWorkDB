import QtQuick 2.15
import QtQuick.Controls 2.15

Item{
    id: _tableDisplay
    //anchors.left: _buttons.right;
    //anchors.top: parent.top;
    //anchors.right: parent.right;
    //anchors.bottom: parent.bottom;

    property int currentRow: -1;
    property alias rep: _rep;
    signal rowClicked();

    Row{
        id: _header;
        width: _table.contentWidth;
        height: 50;//40
        x: -_table.contentX
        z: 1
        Repeater{
            id: _rep;

            Rectangle{
                width: 151;
                height: parent.height;
                color: "#83aae5"//"#5a80fb";

                Text{
                    id: _headerText;
                    anchors.centerIn: parent;
                    text: tableModel.headerData(index,Qt.Horizontal);
                    color: "white";
                    font.pointSize: 11;
                }
            }


        }
    }

    TableView{
        id: _table;
        anchors.left: parent.left;
        anchors.top: _header.bottom;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;

        clip: true;

        ScrollBar.vertical: ScrollBar {
                    active: true;
        }

        ScrollBar.horizontal: ScrollBar{
            active: true;
            policy: ScrollBar.AlwaysOn;
        }

        model: tableModel;

        columnSpacing: 1;

        delegate: Rectangle {
                 implicitWidth: 150;
                 implicitHeight: 50
                 Text {
                     id: text
                     anchors.fill: parent
                     anchors.margins: 4
                     text: display
                     horizontalAlignment: Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter
                     wrapMode: Text.Wrap;
                     font.pointSize: 10;
                     color: "#262626";
                 }
                 color: if(row == _tableDisplay.currentRow) "#badbff"
                        else row % 2? "#edf1fe" : "white";
                 CustomBorder {
                     commonBorder: false
                     lBorderwidth: 0
                     rBorderwidth: 1
                     tBorderwidth: 0
                     bBorderwidth: 0
                     borderColor: "#5a80fb"
                }
                MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         _tableDisplay.currentRow = row;
                         rowClicked();
                     }
                 }
        }
    }
}
