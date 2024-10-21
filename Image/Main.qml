import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: Math.min(parent.width/2, parent.height/2)
        height: width
        border.width: 2
        anchors.centerIn: parent

        Image {
            width: parent.width/2; height: parent.height/2
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "qml.png"
        }
    }

    Image {
        width: 100
        height: width
        fillMode: Image.PreserveAspectFit
        source: "qml.png"
    }
}
