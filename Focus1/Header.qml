import QtQuick
import QtQuick.Layouts

Item {
    id: root

    property alias txtActiveFocus: txtActiveFocus.text
    property alias activeFocusColor: activeFocusRect.color
    property alias clickedColor: clickedRect.color

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: activeFocusRect
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width / 2
            border.width: 1

            Column {
                anchors.fill: parent

                Text {
                    width: parent.width; height: parent.height / 2
                    font.pixelSize: root.height / 5
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: "active focus"
                }
                Text {
                    id: txtActiveFocus
                    width: parent.width; height: parent.height / 2
                    font.pixelSize: root.height / 5
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

        Rectangle {
            id: clickedRect
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width / 2
            border.width: 1

            Behavior on color { ColorAnimation {} }

            Text {
                anchors.fill: parent
                font.pixelSize: root.height / 5
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: "last clicked"
            }
        }
    }
}
