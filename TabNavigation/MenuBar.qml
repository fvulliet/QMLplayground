import QtQuick

// [nav] --------------------------------
FocusScope {
// [nav] --------------------------------
    id: root
    objectName: "[FocusScope] MenuBar"

    property var tabs: []
    property alias orientation: list.orientation
    property alias currentSelection: list.currentIndex

    Rectangle {
        objectName: "[Rectangle] menu bar top rectangle"
        anchors.fill: parent
        color: "transparent"
        // [show nav] --------------------------------
        border {
            width: root.activeFocus ? 4 : 0
            color: "blue"
        }
        // [show nav] --------------------------------

        Rectangle {
            objectName: "[Rectangle] menu bar border"
            width: orientation === Qt.Horizontal ? parent.width : 2
            height: orientation === Qt.Horizontal ? 2 : parent.height
            anchors {
                bottom: orientation === Qt.Horizontal ? parent.bottom : undefined
                right: orientation === Qt.Horizontal ? undefined : parent.right
            }
            color: "black"
        }

        // [nav] --------------------------------
        // use the ListView's currentIndex to deal with nav
        // [nav] --------------------------------
        ListView {
            id: list
            objectName: "[ListView] menu bar list"

            property int itemWidth: list.width/4
            property int itemHeight: list.height/6

            // [nav] --------------------------------
            activeFocusOnTab: true // so that list is part of the tab focus chain
            focus: true // in the FocusScope, list is given the focus by default
            // [nav] --------------------------------
            anchors.fill: parent
            model: root.tabs
            interactive: orientation === Qt.Horizontal ? contentWidth > list.width : contentHeight > list.height
            boundsBehavior: ListView.StopAtBounds
            delegate: Rectangle {
                id: del
                objectName: "[Rectangle] menu bar delegate"

                required property int index
                required property var modelData

                width: orientation === ListView.Vertical ? ListView.view.width : list.itemWidth
                height: orientation === ListView.Vertical ? list.itemHeight : ListView.view.height
                color: list.currentIndex === index ? "black" : "transparent"
                // [show nav] --------------------------------
                border {
                    width: activeFocus ? 4 : 0
                    color: "blue"
                }
                // [show nav] --------------------------------

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // [nav] --------------------------------
                        forceActiveFocus();
                        // [nav] --------------------------------
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
            // [nav] --------------------------------
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
            // [nav] --------------------------------
        }
    }
}
