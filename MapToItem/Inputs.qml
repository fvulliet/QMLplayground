import QtQuick

Item {
    id: root

    // Here, mapFromItem is used to convert the local mouse position in item1 into global coordinates relative to mainWindow.

    Rectangle {
        id: mainWindow
        width: 400; height: 400

        Rectangle {
            id: item1
            width: 200; height: 200
            color: "lightblue"

            MouseArea {
                anchors.fill: parent
                onClicked: function(mouse) {
                    var globalPos = mainWindow.mapFromItem(item1, mouse.x, mouse.y);
                    console.log("Mouse clicked at global position: ", globalPos.x, globalPos.y);
                }
            }
        }
    }

}
