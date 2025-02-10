import QtQuick

Item {
    id: root

    property int counter: 0

    Row {
        anchors.fill: parent

        Loader {
            height: parent.height
            width: parent.width*2/3
            focus: true // this is required so that the focus can be given to the loaded component
            sourceComponent: toto
            onLoaded: {
                item.focus = true // this is required so that the focus can be given to the loaded component
            }
        }
        Text {
            height: parent.height
            width: parent.width/3
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: 128
            text: counter
        }
    }

    Component {
        id: toto

        Rectangle {
            anchors.centerIn: parent
            width: parent.width/2
            height: parent.height/2
            color: "pink"
            border {
                color: "purple"
                width: activeFocus ? 10 : 0
            }
            radius: 10

            Keys.onPressed: (event) => {
                                if (event.key === Qt.Key_Up || event.key === Qt.Key_Plus) {
                                    event.accepted = true;
                                    ++root.counter;
                                } else if (event.key === Qt.Key_Down || event.key === Qt.Key_Minus) {
                                    event.accepted = true;
                                    --root.counter;
                                }
                            }
        }

    }
}
