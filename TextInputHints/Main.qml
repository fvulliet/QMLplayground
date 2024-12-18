import QtQuick

Window {
    id: root

    width: 1280
    height: 960
    visible: true
    title: qsTr("TextInput hints")

    property int _hints: Qt.ImhNoAutoUppercase

    Column {
        anchors.fill: parent

        Item {
            width: parent.width
            height: parent.height/2

            TextInput {
                id: input
                anchors.centerIn: parent
                font.pixelSize: 24
                maximumLength: 8
                inputMethodHints: root._hints
                activeFocusOnPress: true
                focus: true
                cursorDelegate: Rectangle {
                    width: 2
                    height: 20
                    color: "black"
                    visible: input.activeFocus
                }
                onTextChanged: console.log("-----text", text)
            }
        }
        Row {
            width: parent.width
            height: parent.height/2
            spacing: 10

            Rectangle {
                height: parent.height
                width: (parent.width-3*parent.spacing)/4
                border.width: root._hints === Qt.ImhNoAutoUppercase ? 5 : 1

                Text {
                    anchors.fill: parent
                    text: "Qt.ImhNoAutoUppercase"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root._hints = Qt.ImhNoAutoUppercase;
                        }
                    }
                }
            }
            Rectangle {
                height: parent.height
                width: (parent.width-3*parent.spacing)/4
                border.width: root._hints === Qt.ImhPreferUppercase ? 5 : 1

                Text {
                    anchors.fill: parent
                    text: "Qt.ImhPreferUppercase"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root._hints = Qt.ImhPreferUppercase;
                        }
                    }
                }
            }
            Rectangle {
                height: parent.height
                width: (parent.width-3*parent.spacing)/4
                border.width: root._hints === Qt.ImhPreferLowercase ? 5 : 1

                Text {
                    anchors.fill: parent
                    text: "Qt.ImhPreferLowercase"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root._hints = Qt.ImhPreferLowercase;
                        }
                    }
                }
            }
            Rectangle {
                height: parent.height
                width: (parent.width-3*parent.spacing)/4
                border.width: root._hints === (Qt.ImhNoAutoUppercase | Qt.ImhPreferUppercase) ? 5 : 1

                Text {
                    anchors.fill: parent
                    text: "Qt.ImhPreferUppercase\n|\nQt.ImhNoAutoUppercase"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root._hints = Qt.ImhNoAutoUppercase | Qt.ImhPreferUppercase;
                        }
                    }
                }
            }
        }
    }
}
