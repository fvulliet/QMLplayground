import QtQuick

Rectangle {
    id: root

    Column {
        anchors.fill: parent
        spacing: 5

        Row {
            width: parent.width; height: myText1.implicitHeight
            spacing: 5

            Text {
                id: myText1
                height: parent.height
                font.bold: true
                text: "w:"
                font.pixelSize: Math.max(12, height/5)
            }
            Text {
                height: parent.height
                text: root.width
                font.pixelSize: Math.max(12, height/5)
            }
        }
        Row {
            width: parent.width; height: myText2.implicitHeight
            spacing: 5

            Text {
                id: myText2
                height: parent.height
                font.bold: true
                text: "h:"
                font.pixelSize: Math.max(12, height/5)
            }
            Text {
                height: parent.height
                text: root.height
                font.pixelSize: Math.max(12, height/5)
            }
        }
    }
}
