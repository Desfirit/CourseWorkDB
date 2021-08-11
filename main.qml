import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 800
    height: 600
    minimumWidth: 800;
    //maximumWidth: 801
    minimumHeight: 600;
    //maximumHeight: 601;

    visible: true
    title: qsTr("Курсовая работа по базам данных")

    StackView{
        id: _stackView;
        anchors.fill: parent;
        initialItem: _authorizationPage
    }

    AuthorizationPage{
        id: _authorizationPage;
        onLoginButtonClicked: {
            let res = backend.validateUser(login,password);
            switch (res){
                case "Admin":
                    _stackView.push(_adminPage);
                    backend.open(256);
                    _adminPage.tableView.rep.model = 0;
                    _adminPage.tableView.rep.model = tableModel.columnCount();
                    _adminPage.tableView.currentRow = -1
                    _adminPage._students.groupEdit.model = tableModel.select(259);
                    _adminPage.stack.width = 200;
                    console.log("Admin profile");
                    break;
                case "Student":
                    _stackView.push(_studentPage);
                    backend.open(256);
                    _studentPage.profile.fioText = qsTr(tableModel.data(tableModel.index(0,0)));
                    _studentPage.profile.groupNameText = qsTr(tableModel.data(tableModel.index(0,2)));
                    _studentPage.profile.courseText = tableModel.data(tableModel.index(0,1));
                    _studentPage.profile.brigadeNameText = qsTr(tableModel.data(tableModel.index(0,3)));
                    _studentPage.profile.peopleCountText = tableModel.data(tableModel.index(0,4));
                    _studentPage.profile.objectNameText = qsTr(tableModel.data(tableModel.index(0,5)));
                    _studentPage.profile.locationText = qsTr(tableModel.data(tableModel.index(0,6)));
                    console.log("Student profile");
                    break;
                case "WrongInput":
                    console.log("Wrong Input");
                    warningText = "Не верный логин или пароль";
                    break;
                case "FailedConnection":
                    console.log("Failed connection");
                    warningText = "Не удалось подключиться к базе данных";
                    break;
                default:
                    console.log("Unexpected exception");
                    warningText = "Непредвиденная ошибка"
                    break;
            }
        }
    }

    AdminPage{
        id: _adminPage;
        visible: false;
    }

    StudentPage{
        id: _studentPage;
        visible: false;
    }
}
