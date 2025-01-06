pragma ComponentBehavior: Bound
import QtQuick

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Passing data between components")

    Row {
        id: row

        property var myData: [0,1,2]

        anchors.fill: parent

        Column {
            height: parent.height; width: parent.width/2

            Child {
                width: parent.width; height: parent.height/2
                myData: row.myData
                isAdd: true
                onUpdateMyData: function(d) {
                    row.myData = d;
                }
            }
            Child {
                width: parent.width; height: parent.height/2
                myData: row.myData
                isAdd: false
                onUpdateMyData: function(d) {
                    row.myData = d;
                }
            }
        }
        Item {
            height: parent.height; width: parent.width/2

            ListView {
                id: list
                anchors.fill: parent
                model: row.myData
                delegate: Item {
                    id: del

                    required property var modelData

                    width: list.width
                    height: 30

                    Rectangle {
                        border.width: 1
                        anchors {
                            fill: parent
                            margins: 5
                        }

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: del.modelData
                        }
                    }
                }
            }
        }
    }
}
