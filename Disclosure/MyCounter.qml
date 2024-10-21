import QtQuick

Rectangle {
    id: root

    // this way, countHost.counter is reachable by the component which use MyButton
    property alias count: countHost.counter

    signal clicked()

    color: mouseArea.pressed ? "black" : "lightgray"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: root.clicked()
    }

    Text {
        id: countHost

        property int counter

        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: counter
        font.pixelSize: height/4
        color: mouseArea.pressed ? "lightgray" : "black"
    }
}
