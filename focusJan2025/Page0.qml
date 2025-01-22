import QtQuick

FocusScope {
    id: root

    QtObject {
        id: _
        property int currentSelection: 0
    }

    Keys.onPressed: (event) => {
        if (event.key == Qt.Key_Up) {
            event.accepted = true;
            if (_.currentSelection > 0)
                _.currentSelection--;
        } else if (event.key == Qt.Key_Down) {
            event.accepted = true;
            if (_.currentSelection < 2)
                _.currentSelection++;
        }
    }

    Column {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 16

        Rectangle {
            width: parent.width
            height: (parent.height-2*parent.spacing)/3
            border {
                width: 8
                color: "green"
            }
            color: activeFocus ? "green" : "white"
            focus: _.currentSelection === 0
        }
        Rectangle {
            width: parent.width
            height: (parent.height-2*parent.spacing)/3
            border {
                width: 8
                color: "blue"
            }
            color: activeFocus ? "blue" : "white"
            focus: _.currentSelection === 1
        }
        Rectangle {
            width: parent.width
            height: (parent.height-2*parent.spacing)/3
            border {
                width: 8
                color: "red"
            }
            color: activeFocus ? "red" : "white"
            focus: _.currentSelection === 2
        }
    }
}
