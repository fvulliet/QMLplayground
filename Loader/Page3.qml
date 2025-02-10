import QtQuick

Item {
    id: root

    Row {
        anchors.fill: parent

        Loader {
            sourceComponent: withSize
        }
        Loader {
            height: 200
            width: 200
            sourceComponent: withoutSize
        }
    }

    Component {
        id: withSize

        Rectangle {
            color: "yellow"
            width: 200; height: 200
        }
    }

    Component {
        id: withoutSize

        Rectangle {
            color: "blue"
        }
    }
}
