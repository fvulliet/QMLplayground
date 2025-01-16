import QtQuick

Item {
    id: root

    property int currentSelection: 0
    property var tabs: []

    component ButtonComp :Rectangle {
        id: btnComp

        property alias label: txt.text
        property bool selected: false

        signal clicked()

        border {
            color: "#2E2E2E"
            width: btnComp.selected ? 3 : 1
        }

        radius: 5
        color: "#F1F2FC"

        Text {
            id: txt
            anchors.fill: parent
            font.pixelSize: height/3
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#2E2E2E"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: btnComp.clicked()
        }
    }

    ListView {
        anchors.fill: parent
        model: root.tabs
        orientation: ListView.Horizontal
        delegate: Rectangle {
            id: del
            required property int index
            required property var modelData
            height: ListView.view.height
            width: ListView.view.width/ListView.view.count
            color: root.currentSelection === del.index ? "#E1E2EC" : "white"

            ButtonComp {
                width: parent.width/3; height: width/3
                label: del.modelData
                anchors.centerIn: parent
                selected: root.currentSelection === del.index
                onClicked: root.currentSelection = del.index
            }
        }
    }
}
