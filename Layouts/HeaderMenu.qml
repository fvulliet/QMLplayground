import QtQuick

Rectangle {
    id: root

    property alias label: txt.text
    property bool selected: false

    signal clicked()

    border {
        color: "#2E2E2E"
        width: root.selected ? 3 : 1
    }

    radius: 5
    color: "white"

    Text {
        id: txt
        anchors.fill: parent
        font.pixelSize: height/3
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#2E2E2E"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
