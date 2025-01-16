import QtQuick

Window {
    id: root

    width: 1600
    height: width * 960 / 1280
    visible: true
    title: qsTr("MapToItem")

    QtObject {
        id: _
        property int currentSelection: 0
    }

    Column {
        anchors.fill: parent
        spacing: 0

        Header {
            width: parent.width; height: (parent.height-parent.spacing)/10
            currentSelection: _.currentSelection
            onCurrentSelectionChanged: _.currentSelection = currentSelection
            tabs: ["coordinates", "popups", "dragdrop", "collisions", "inputs"]
        }

        Loader {
            width: parent.width; height: (parent.height-parent.spacing)*9/10
            source: {
                if (_.currentSelection === 1)
                    return Qt.resolvedUrl("./Popups.qml");
                if (_.currentSelection === 2)
                    return Qt.resolvedUrl("./DragDrop.qml");
                if (_.currentSelection === 3)
                    return Qt.resolvedUrl("./Collisions.qml");
                if (_.currentSelection === 4)
                    return Qt.resolvedUrl("./Inputs.qml");
                return Qt.resolvedUrl("./Coordinates.qml");
            }
        }
    }
}
