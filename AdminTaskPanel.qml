import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    signal second2APressed();
    signal second2BPressed();
    signal second2CSelectNoCorPressed();
    signal second2CSelectCorPressed();
    signal second2CFromNoCorPressed();
    signal second2CFromCorPressed();
    signal second2CWhereNoCorAndAnyPressed();
    signal second2CWhereCorPressed();
    signal second2DHavingPressed();

    id: objects

    SimpleButton{
        id: _second2A;
        anchors.top: objects.top;
        anchors.left: objects.left;
        anchors.right: objects.verticalCenter;
        anchors.margins: 10;
        width: 130;

        buttonText: "2A Case When";
        idleColor:  "#5A759C";

        onClicked: {
            second2APressed();
        }
    }
    SimpleButton{
        id: _second2B;
        anchors.top: objects.top;
        anchors.left: objects.verticalCenter;
        anchors.right: objects.right;
        anchors.margins: 10;
        width: 130;

        buttonText: "2B на основе view";
        idleColor: "#5A759C";

        onClicked: {
            second2BPressed();
        }
    }
    SimpleButton{
        id: _second2CSelectNoCor;
        anchors.top: _second2A.bottom;
        anchors.left: objects.left;
        anchors.right: objects.verticalCenter;
        anchors.margins: 10;
        width: 130;


        buttonText: "2C Select Некор";
        idleColor: "#5A759C";

        onClicked: {
            second2CSelectNoCorPressed();
        }
    }
    SimpleButton{
        id: _second2CSelectCor;
        anchors.top: _second2B.bottom;
        anchors.left: objects.verticalCenter;
        anchors.right: objects.right;
        anchors.margins: 10;
        width: 130;


        buttonText: "2C Select Кор";
        idleColor: "#5A759C";

        onClicked: {
            second2CSelectCorPressed();
        }
    }

    SimpleButton{
        id: _second2CFromNoCor;
        anchors.top: _second2CSelectNoCor.bottom;
        anchors.left: objects.left;
        anchors.right: objects.verticalCenter;
        anchors.margins: 10;
        width: 130;


        buttonText: "2C From Некор";
        idleColor: "#5A759C";

        onClicked: {
            second2CFromNoCorPressed()
        }
    }

    SimpleButton{
        id: _second2CFromCor;
        anchors.top: _second2CSelectCor.bottom;
        anchors.left: objects.verticalCenter;
        anchors.right: objects.right;
        anchors.margins: 10;
        width: 130;


        buttonText: "2C From Кор";
        idleColor: "#5A759C";

        onClicked: {
            second2CFromCorPressed()
        }
    }
    SimpleButton{
        id: _second2CWhereNoCor;
        anchors.top: _second2CFromNoCor.bottom;
        anchors.left: objects.left;
        anchors.right: objects.verticalCenter;
        anchors.margins: 10;
        width: 130;


        buttonText: "2C и 2E Where Некор + Any";
        idleColor: "#5A759C";

        labelEdit.font.pointSize: 7;

        onClicked: {
            second2CWhereNoCorAndAnyPressed()
        }
    }

    SimpleButton{
        id: _second2CWhereCor;
        anchors.top: _second2CFromCor.bottom;
        anchors.left: objects.verticalCenter;
        anchors.right: objects.right;
        anchors.margins: 10;
        width: 130;


        buttonText: "2C Where Кор";
        idleColor: "#5A759C";

        onClicked: {
            second2CWhereCorPressed()
        }
    }
    SimpleButton{
        id: _second2D;
        anchors.top: _second2CWhereNoCor.bottom;
        anchors.left: objects.left;
        anchors.right: objects.verticalCenter;
        anchors.margins: 10;
        width: 130;


        buttonText: "2D Having";
        idleColor: "#5A759C";

        onClicked: {
            second2DHavingPressed();
        }
    }

    Rectangle{
        anchors.fill: parent;
        z: -1;
    }
}
