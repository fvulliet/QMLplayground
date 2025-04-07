import QtQuick
import QtQuick.Controls

FocusScope { // needed because one of the children uses 'focus'
    id: root

    property var tabs: []
    property alias orientation: list.orientation
    property alias currentSelection: list.currentIndex

    Rectangle {
        color: "white"
        anchors.fill: parent

        Rectangle {
            width: orientation === Qt.Horizontal ? parent.width : 2
            height: orientation === Qt.Horizontal ? 2 : parent.height
            anchors.bottom: orientation === Qt.Horizontal ? parent.bottom : undefined
            anchors.right: orientation === Qt.Horizontal ? undefined : parent.right
            color: "black"
        }

        ListView {
            id: list

            property int itemWidth: list.width/4
            property int itemHeight: list.height/6

            focus: true
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
                color: list.currentIndex === index ? "black" : "transparent"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("click");
                        list.currentIndex = del.index;
                    }
                }

                Text {
                    anchors.fill: parent
                    font.pixelSize: Math.min(32, height/3)
                    text: del.modelData.label
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: list.currentIndex === index ? "white" : "black"
                }
            }
            Keys.onLeftPressed: {
                if (orientation === Qt.Horizontal)
                    decrementCurrentIndex();
            }
            Keys.onRightPressed: {
                if (orientation === Qt.Horizontal)
                    incrementCurrentIndex();
            }
            Keys.onUpPressed: {
                if (orientation === Qt.Vertical)
                    decrementCurrentIndex();
            }
            Keys.onDownPressed: {
                if (orientation === Qt.Vertical)
                    incrementCurrentIndex();
            }
        }
    }
}
