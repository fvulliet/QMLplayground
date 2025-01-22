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
                color: "blue"
            }
            color: activeFocus ? "blue" : "white"
            focus: _.currentSelection === 0
        }

        FocusScope {
            width: parent.width
            height: (parent.height-2*parent.spacing)/3
            focus: _.currentSelection === 1

            QtObject {
                id: __
                property int currentSelection: 0
            }

            Keys.onPressed: (event) => {
                if (event.key == Qt.Key_Left) {
                    event.accepted = true;
                    if (__.currentSelection > 0)
                        __.currentSelection--;
                } else if (event.key == Qt.Key_Right) {
                    event.accepted = true;
                    if (__.currentSelection < 1)
                        __.currentSelection++;
                }
            }

            Row {
                anchors.fill: parent
                spacing: 16

                Rectangle {
                    height: parent.height
                    width: (parent.width-parent.spacing)/2
                    border {
                        width: 8
                        color: "black"
                    }
                    color: activeFocus ? "black" : "white"
                    focus: __.currentSelection === 0
                }
                Rectangle {
                    height: parent.height
                    width: (parent.width-parent.spacing)/2
                    border {
                        width: 8
                        color: "black"
                    }
                    color: activeFocus ? "black" : "white"
                    focus: __.currentSelection === 1
                }
            }
        }

        Rectangle {
            width: parent.width
            height: (parent.height-2*parent.spacing)/3
            border {
                width: 8
                color: "yellow"
            }
            color: activeFocus ? "yellow" : "white"
            focus: _.currentSelection === 2
        }
    }
}
