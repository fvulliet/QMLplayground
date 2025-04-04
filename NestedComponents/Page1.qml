import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    color: "lightgray"

    Column {
        anchors.fill: parent
        spacing: 10

        Toto {
            id: toto
            width: parent.width
            height: (parent.height-parent.spacing)/2
        }
        Rectangle {
            width: parent.width
            height: (parent.height-parent.spacing)/2
            color: toto.MyTiti.color
        }
    }
}
