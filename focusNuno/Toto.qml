import QtQuick

FocusScope {
    //focus: true
    objectName: "totoFC"
    Rectangle {
        id: top
        objectName: "totorect1"
        width: parent.width
        height: parent.height/2
        color: "red"
    }
    Rectangle {
        objectName: "totorect2"
        anchors.top: top.bottom
        width: parent.width
        height: parent.height/2
        color: "blue"
        focus: true

        MouseArea {
            anchors.fill: parent
            onClicked: top.focus = true;
        }
    }
}
