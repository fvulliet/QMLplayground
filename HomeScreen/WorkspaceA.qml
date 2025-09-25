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
        text: "A"
        font.pixelSize: Math.min(64, height/2)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    QuickAccessControl {
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: parent.height/5
        }
        height: 32
        customActions: ["A-QA1", "A-QA2"]
    }
}
