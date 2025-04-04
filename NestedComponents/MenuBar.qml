import QtQuick
import QtQuick.Controls

Rectangle {
    id: root

    property int currentSelection: 0
    property var tabs: []
    property alias orientation: list.orientation

    color: "white"

    Rectangle {
        width: parent.width
        color: "black"
        height: 2
        anchors.bottom: parent.bottom
    }

    ListView {
        id: list

        property int itemWidth: list.width/4
        property int itemHeight: list.height/6
        property bool leftReached: contentX <= 0
        property bool rightReached: (contentX + width) >= (contentWidth - 0.1)
        property bool topReached: contentY <= 0
        property bool bottomReached: (contentY + height) >= (contentHeight - 0.1)
        property int currentPage: orientation === Qt.Horizontal ? Math.ceil(contentX/width) : Math.ceil(contentY/height)

        function previous() {
            if (root.currentSelection>0)
                --root.currentSelection;
        }

        function next() {
            if (root.currentSelection<(count-1))
                ++root.currentSelection;
        }

        anchors.fill: parent
        model: root.tabs
        interactive: orientation === Qt.Horizontal ? contentWidth > list.width : contentHeight > list.height
        boundsBehavior: ListView.StopAtBounds
        delegate: Rectangle {
            id: del

            required property int index
            required property var modelData

            width: orientation === ListView.Vertical ? ListView.view.width : list.itemWidth
            height: orientation === ListView.Vertical ? list.itemHeight : ListView.view.height
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
        ScrollBar.horizontal: ScrollBar {
            active: list.interactive
            orientation: list.orientation
            snapMode: ScrollBar.NoSnap
            anchors {
                left: orientation === Qt.Horizontal ? list.left : undefined
                right: list.right
                bottom: list.bottom
                top: orientation === Qt.Horizontal ? undefined : list.top
            }
        }
    }
}
