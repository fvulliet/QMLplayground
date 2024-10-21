import QtQuick
import QtQuick.Controls

Rectangle {
    id: root

    // expose elements for testing purpose; yes, that's intrusive :o(
    property alias button: myButton
    property alias text: myText.text

    color: "#ff0000"

    Text {
        id: myText
        text: "not clicked"
        anchors.centerIn: parent
    }

    Button {
        id: myButton
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        text: "click me"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                myText.text = "clicked"
                root.color = "#00ff00"
            }
        }
    }
}
