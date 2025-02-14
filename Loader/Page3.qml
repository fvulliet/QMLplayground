import QtQuick

Item {
    id: root

    Row {
        anchors.fill: parent

        Row {
            height: parent.height
            width: parent.width/2

            Loader {
                sourceComponent: withSize
            }
            Loader {
                height: 200
                width: 200
                sourceComponent: withoutSize
            }
        }
        Item {
            height: parent.height
            width: parent.width/2

            Rectangle {
                width: 100
                height: 100
                border {
                    width: 4
                    color: "red"
                }
                color: "transparent"

                Loader {
                    anchors.fill: parent
                    sourceComponent: Rectangle {
                        width: 200
                        height: 100
                        border.width: 2
                        border.color: "green"
                        color: "transparent"
                    }
                }
            }
        }
    }

    Component {
        id: withSize

        Rectangle {
            color: "yellow"
            width: 200; height: 200
        }
    }

    Component {
        id: withoutSize

        Rectangle {
            color: "blue"
        }
    }
}
