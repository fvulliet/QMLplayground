import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property var customActions: []

    signal actionClicked(int idx)

    border {
        width: customActions?.length > 0 ? 1 : 0
        color: "black"
    }
    radius: 16
    implicitWidth: layout.width + 32

    RowLayout {
        id: layout

        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            model: customActions
            delegate: Item {
                id: del

                required property int index
                required property var modelData

                height: parent.height
                width: txt.width + spacer.width + 1

                MouseArea {
                    anchors.fill: parent
                    onClicked: actionClicked(del.index)
                }

                Row {
                    anchors.fill: parent

                    Text {
                        id: txt
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        width: contentWidth
                        font.pixelSize: 24
                        text: del.modelData
                    }
                    Item {
                        id: spacer
                        height: parent.height
                        width: del.index < (customActions.length - 1) ? 24 : 0
                    }
                    Rectangle {
                        height: parent.height / 2
                        anchors.verticalCenter: parent.verticalCenter
                        color: "black"
                        width: visible ? 1 : 0
                        visible: del.index < (customActions.length-1)
                    }
                }
            }
        }
    }
}
