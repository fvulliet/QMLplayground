import QtQuick

Item {
    id: root

    property alias color: myRect.color

    Rectangle {
        id: myRect

        anchors {
            fill: parent
            margins: 10
        }
    }
}
