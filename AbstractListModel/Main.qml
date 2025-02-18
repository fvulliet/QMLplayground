import QtQuick
import AbstractListModel

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    MyModel {
        id: myModel
    }

    Component.onCompleted: {
        myModel.appendElement("toto", 0);
        myModel.appendElement("titi", 1);
        myModel.appendElement("tata", 2);
    }

    Row {
        anchors {
            fill: parent
            margins: 20
        }
        spacing: 20

        Column {
            id: side
            height: parent.height
            width: 100

            Item {
                width: parent.width
                height: parent.height/2

                Rectangle {
                    width: parent.width*0.5
                    height: width/2
                    color: "lightgray"
                    anchors.centerIn: parent

                    Text {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: "append"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: myModel.appendElement("aaa", myModel.myCount)
                    }
                }
            }
            Item {
                width: parent.width
                height: parent.height/2

                Text {
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: myModel.myCount
                }
            }
        }

        ListView {
            id: list
            height: parent.height
            width: parent.width - side.width - parent.spacing
            model: myModel
            delegate: Rectangle {
                id: del

                required property var modelData

                border.width: 1
                height: 50
                width: list.width

                Row {
                    anchors.fill: parent

                    Text {
                        height: parent.height
                        width: (parent.width-parent.spacing)/2
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: del.height/3
                        text: del.modelData.label
                    }
                    Text {
                        height: parent.height
                        width: (parent.width-parent.spacing)/2
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: del.height/3
                        text: del.modelData.value
                    }
                }
            }
        }
    }
}
