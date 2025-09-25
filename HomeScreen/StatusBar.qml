import QtQuick

Rectangle {
    id: root

    color: "transparent"
    border {
        width: 1
        color: "black"
    }

    Row {
        height: parent.height
        anchors {
            right: parent.right
            rightMargin: 8
        }
        spacing: 8

        Repeater {
            model: 3
            Rectangle {
                width: height; height: root.height * 0.8
                anchors.verticalCenter: parent.verticalCenter
                border.width: 1
                color: "transparent"
            }
        }
    }

}
