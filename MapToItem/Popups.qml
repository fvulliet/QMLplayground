import QtQuick

Item {
    id: root

    //Here, mapFromItem is used to synchronize the movement of an item between two containers, ensuring the second item follows the first item.

    Rectangle {
        id: mainWindow
        width: 400; height: 400

        Rectangle {
            id: button
            width: 100; height: 50
            color: "green"
            anchors.centerIn: parent

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var point = mainWindow.mapFromItem(button, 0, button.height);
                    tooltip.x = point.x;
                    tooltip.y = point.y;
                    tooltip.visible = true;
                }
            }
        }

        Rectangle {
            id: tooltip
            width: 150; height: 50
            color: "yellow"
            visible: false
        }
    }

}
