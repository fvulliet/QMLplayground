import QtQuick

Window {
    id: root

    width: 1280
    height: 960
    visible: true
    title: qsTr("Layouts")

    QtObject {
        id: _
        property int currentSelection: 1
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
                    label: "ColumnLayout"
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
                    label: "RowLayout"
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
                    label: "GridLayout"
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
                source: {
                    if (_.currentSelection === 0)
                        return Qt.resolvedUrl("./MyColumnLayout.qml");
                    if (_.currentSelection === 1)
                        return Qt.resolvedUrl("./MyRowLayout.qml");
                    return Qt.resolvedUrl("./MyGridLayout.qml");
                }
            }
        }
    }
}
