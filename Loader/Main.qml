import QtQuick

Window {
    id: root
    width: 1280
    height: 960
    visible: true
    title: qsTr("Loader")

    QtObject {
        id: _
        property int currentSelection: 0
    }

    Column {
        anchors.fill: parent
        spacing: 20

        Row {
            id: header
            width: parent.width; height: 100

            Rectangle {
                height: parent.height; width: parent.width/3
                color: _.currentSelection === 0 ? "#E1E2EC" : "white"

                HeaderMenu {
                    width: parent.width/3; height: parent.height/2
                    label: "visibility"
                    anchors.centerIn: parent
                    selected: _.currentSelection === 0
                    onClicked: _.currentSelection = 0
                }
            }
            Rectangle {
                height: parent.height; width: parent.width/3
                color: _.currentSelection === 1 ? "#E1E2EC" : "white"

                HeaderMenu {
                    width: parent.width/3; height: parent.height/2
                    label: "focus"
                    anchors.centerIn: parent
                    selected: _.currentSelection === 1
                    onClicked: _.currentSelection = 1
                }
            }
            Rectangle {
                height: parent.height; width: parent.width/3
                color: _.currentSelection === 2 ? "#E1E2EC" : "white"

                HeaderMenu {
                    width: parent.width/3; height: parent.height/2
                    label: "size"
                    anchors.centerIn: parent
                    selected: _.currentSelection === 2
                    onClicked: _.currentSelection = 2
                }
            }
        }

        Item {
            width: parent.width; height: parent.height - parent.spacing - header.height

            Loader {
                anchors {
                    fill: parent
                    margins: 10
                }
                focus: true
                source: {
                    if (_.currentSelection === 0)
                        return Qt.resolvedUrl("./Page1.qml");
                    else if (_.currentSelection === 1)
                        return Qt.resolvedUrl("./Page2.qml");
                    return Qt.resolvedUrl("./Page3.qml");
                }
            }
        }
    }

}
