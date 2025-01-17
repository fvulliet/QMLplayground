import QtQuick

FocusScope {
    objectName: "totoFC"
    Rectangle {
        id: red
        objectName: "redRect"
        width: parent.width
        height: parent.height/2
        color: "red"

        MouseArea {
            anchors.fill: parent
            onClicked: red.focus = true;
        }
    }
    Rectangle {
        id: blue
        objectName: "blueRect"
        anchors.top: red.bottom
        width: parent.width
        height: parent.height/2
        color: "blue"
        focus: true

        MouseArea {
            anchors.fill: parent
            onClicked: blue.focus = true;
        }
    }
}
