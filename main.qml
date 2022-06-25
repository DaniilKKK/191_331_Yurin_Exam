import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.0



ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Экзамен Юрин Даниил 191-331")

    property int recordId: -1
    property int isPassword: -1
    property string pin_code: ""


    Connections {
            target: cryptoController
            onSendMessageToQml: {
                dialog.open()
                dialogText.text = message
            }

    }


    ListModel {
        id: listmodel2
        // Items таблицы бд
    }

    function crypt_controller(password) {
            let is_correct_passwd = cryptoController.check_password(password)
            if(is_correct_passwd) {
                pin_code=password

                stackView.push(pageMain)
            } else {
                stackView.push(pageError)
            }
    }

    StackView {
        anchors.fill: parent
        id: stackView

        initialItem: Page {
            id: pageLogin

            GridLayout {
                anchors.fill: parent
                rowSpacing: 10
                rows: 4
                flow: GridLayout.TopToBottom

                Item { // Для заполнения пространства
                    Layout.row: 0
                    Layout.fillHeight: true
                }

                TextField {
                    id: password_code
                    echoMode: TextField.Password
                    passwordCharacter: "●"
                    Layout.row: 1
                    Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
                }

                Button {
                    id: login_button
                        text: qsTr("Вход")
                        Layout.row: 2
                        Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
                        onClicked:{
                            crypt_controller(password_code.text)
                            password_code.text = ""
                        }
                }

                Item { // Для заполнения пространства
                    Layout.row: 4
                    Layout.fillHeight: true
                }
            }
        }

        Page {
            id: pageError
            visible: false


            GridLayout {
                anchors.fill: parent
                rowSpacing: 10
                rows: 3
                flow: GridLayout.TopToBottom

                Item { // Для заполнения пространства
                    Layout.row: 0
                    Layout.fillHeight: true
                }
                Label {
                    id: error_code
                    text: "Код неверный!"
                    Layout.row: 1
                    Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
                }

                Button {
                    id: back_to_login_page
                    text: qsTr("Назад")
                    Layout.row: 2
                    Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
                    onClicked:{
                        if( stackView.depth > 1 ) {
                            stackView.pop()
                        }
                    }
                }
                Item { // Для заполнения пространства
                    Layout.row: 3
                    Layout.fillHeight: true
                }
            }
        }

        Page {
            id: pageMain
            visible: false

            GridLayout {
                  id: grid
                  anchors.fill: parent
                  rows: 3
                  columns: 2

                  Button {

                       id: b1
                       //color: "red"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 2
                       //Layout.rowSpan: 1
                       Layout.row: 1
                       Layout.column: 0

                       onClicked:
                       {

                       }
                  }

                  Button {
                        id: b2
                       //color: "blue"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 1
                       //Layout.rowSpan: 2
                       Layout.row: 2
                       Layout.column: 0
                  }

                  Button {
                      id: b3
                       //color: "green"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 1
                       //Layout.rowSpan: 2
                       Layout.row: 3
                       Layout.column: 0
                  }

                  Button {
                      id: b4
                       //color: "white"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       Layout.columnSpan: 1
                       Layout.rowSpan: 1
                       Layout.row: 4
                       Layout.column: 0
                  }

                  Button {
                       id: b5
                       //color: "yellow"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 2
                       //Layout.rowSpan: 1
                       Layout.row: 5
                       Layout.column: 0
                  }
                  Button {
                       id: b6
                       //color: "yellow"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 2
                       //Layout.rowSpan: 1
                       Layout.row: 6
                       Layout.column: 0
                  }

                  Button {
                       id: b7
                       //color: "yellow"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 2
                       //Layout.rowSpan: 1
                       Layout.row: 7
                       Layout.column: 0
                  }

                  Button {
                       id: b8
                       //color: "yellow"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 2
                       //Layout.rowSpan: 1
                       Layout.row: 8
                       Layout.column: 0
                  }

                  Button {
                       id: b9
                       //color: "yellow"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 2
                       //Layout.rowSpan: 1
                       Layout.row: 9
                       Layout.column: 0
                  }


                  Button {
                       id: b10
                       //color: "yellow"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 2
                       //Layout.rowSpan: 1
                       Layout.row: 10
                       Layout.column: 0
                  }

                  Button {
                       id: b11
                       //color: "yellow"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 2
                       //Layout.rowSpan: 1
                       Layout.row:1
                       Layout.column: 0
                  }

                  Button {
                       id: b12
                       //color: "yellow"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 2
                       //Layout.rowSpan: 1
                       Layout.row: 12
                       Layout.column: 0
                  }

                  Button {
                       id: b13
                       //color: "yellow"
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       //Layout.columnSpan: 2
                       //Layout.rowSpan: 1
                       Layout.row: 13
                       Layout.column: 0
                  }

              }
          }
    }
}

