import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: zoomButton
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        implicitWidth: icon.width + 30
        height: icon.implicitHeight + 30

        Text {
            id: icon

            anchors {
                left: parent.left
                leftMargin: zoomButton.margin
                right: parent.right
                rightMargin: zoomButton.margin
            }

            text: "lkjhlkjbmkjb"
        }
    }
}
