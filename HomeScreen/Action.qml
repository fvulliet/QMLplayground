import QtQuick

Item {
    property alias label: txt.text

    signal actionClicked

    Text {
        id: txt
        anchors {
            fill: parent
            margins: 8
        }
        font.pixelSize: Math.min(16, height/2)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        anchors.fill: parent
        onClicked: actionClicked()
    }
}
