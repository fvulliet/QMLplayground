import QtQuick

Rectangle {
    id: root

    color: "transparent"
    border {
        width: 1
        color: "black"
    }

    Text {
        id: txt
        anchors {
            fill: parent
            margins: 8
        }
        text: "C"
        font.pixelSize: Math.min(64, height/2)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
