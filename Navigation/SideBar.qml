import QtQuick

Rectangle {
    id: root

    property int currentSelection: 0
    property var tabs: []

    border.width: 2
    color: "white"

    Keys.onPressed: (event)=> {
        if (event.key == Qt.Key_Up) {
            event.accepted = true;
            if (currentSelection > 0)
                currentSelection--;
        } else if (event.key == Qt.Key_Down) {
            event.accepted = true;
            if (currentSelection < (tabs.length-1))
                currentSelection++;
        }
    }

    ListView {
        anchors.fill: parent
        anchors.margins: parent.border.width
        model: root.tabs
        orientation: ListView.Vertical
        delegate: Rectangle {
            id: del
            required property int index
            required property var modelData
            width: ListView.view.width
            height: Math.min(100, ListView.view.height/ListView.view.count)
            color: root.currentSelection === del.index ? "black" : "white"

            Text {
                anchors.fill: parent
                font.pixelSize: Math.min(32, height/3)
                text: del.modelData
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
