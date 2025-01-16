import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root

    Rectangle {
        id: containerA
        width: 200
        height: 200
        color: "lightblue"
        border.color: "blue"
    }

    Rectangle {
        id: containerB
        width: 200
        height: 200
        x: 250
        color: "lightgreen"
        border.color: "green"

        DropArea {
            id: dropArea
            anchors.fill: parent
            onDropped: {
                // Map the draggable item's coordinates from containerA to containerB
                var mappedPoint = containerB.mapFromItem(root, draggableItem.x, draggableItem.y);
                draggableItem.parent = containerB;  // Reparent to containerB
                draggableItem.x = mappedPoint.x;
                draggableItem.y = mappedPoint.y;
            }
        }
    }

    Rectangle {
        id: draggableItem
        width: 50
        height: 50
        color: "red"
        z: 2  // Ensure it's drawn on top

        MouseArea {
            id: dragArea
            anchors.fill: parent
            drag.target: parent  // Enables dragging of the item itself

            onReleased: {
                // Reparent back to containerA when dropped outside containerB
                if (!dropArea.containsMouse) {
                    var mappedPoint = containerA.mapFromItem(root, draggableItem.x, draggableItem.y);
                    draggableItem.parent = containerA;
                    draggableItem.x = mappedPoint.x;
                    draggableItem.y = mappedPoint.y;
                }
            }
        }

        Drag.active: dragArea.drag.active
        Drag.hotSpot.x: width / 2
        Drag.hotSpot.y: height / 2
    }

    // Use the window as a floating layer
    Component.onCompleted: {
        draggableItem.parent = root;  // Move the draggable item to the top-level window
    }
}
