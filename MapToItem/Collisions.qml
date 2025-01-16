import QtQuick

Item {
    id: root

    // In this case, mapFromItem helps detect when movingItem (from containerA) collides with targetItem in containerB.

    Rectangle {
        id: containerA
        width: 200; height: 200

        Rectangle {
            id: movingItem
            width: 50; height: 50
            color: "green"
            x: 50
            y: 50
        }
    }

    Rectangle {
        id: containerB
        width: 200; height: 200
        x: 250

        Rectangle {
            id: targetItem
            width: 50; height: 50
            color: "red"
            x: 100
            y: 100
        }

        Timer {
            interval: 30
            repeat: true
            running: true
            onTriggered: {
                var mappedPoint = containerB.mapFromItem(movingItem, movingItem.x, movingItem.y);
                if (mappedPoint.x >= targetItem.x && mappedPoint.x <= (targetItem.x + targetItem.width) &&
                    mappedPoint.y >= targetItem.y && mappedPoint.y <= (targetItem.y + targetItem.height)) {
                    targetItem.color = "yellow";
                } else {
                    targetItem.color = "red";
                }
            }
        }
    }

}
