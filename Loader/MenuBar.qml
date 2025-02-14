import QtQuick

Rectangle {
    id: root

    property int currentSelection: 0
    property var tabs: []
    property alias orientation: list.orientation

    border.width: 2
    color: "white"

    ListView {
        id: list
        anchors {
            fill: parent
            margins: parent.border.width
        }
        model: root.tabs
        orientation: ListView.Horizontal
        delegate: Rectangle {
            id: del

            required property int index
            required property var modelData

            width: orientation === ListView.Vertical ? ListView.view.width : ListView.view.width/ListView.view.count
            height: orientation === ListView.Vertical ? ListView.view.height/ListView.view.count : ListView.view.height
            color: root.currentSelection === del.index ? "black" : "white"

            Text {
                anchors.fill: parent
                font.pixelSize: Math.min(32, height/3)
                text: del.modelData.label
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: root.currentSelection === del.index ? "white" : "black"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: root.currentSelection = del.index
            }
        }
    }
}
