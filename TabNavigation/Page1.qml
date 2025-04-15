import QtQuick
import QtQuick.Controls

// [nav] --------------------------------
FocusScope {
// [nav] --------------------------------
    id: root
    objectName: "[FocusScope] Page1"

    signal quitNav

    Column {
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 10

        Button {
            id: btn1
            objectName: "[Button] button 1"
            // [nav] --------------------------------
            focus: true
            // [nav] --------------------------------
            width: parent.width
            height: (parent.height - 2*parent.spacing - 4*parent.spacing)/5
            text: "Button 1"
            highlighted: activeFocus
            // [nav] --------------------------------
            KeyNavigation.up: nextItemInFocusChain(false)
            KeyNavigation.down: nextItemInFocusChain()
            // [nav] --------------------------------
        }

        Button {
            id: btn2
            objectName: "[Button] button 2"
            width: parent.width
            height: (parent.height - 2*parent.spacing - 4*parent.spacing)/5
            text: "Button 2"
            highlighted: activeFocus
            // [nav] --------------------------------
            KeyNavigation.up: nextItemInFocusChain(false)
            KeyNavigation.down: nextItemInFocusChain()
            // another way would be
            // KeyNavigation.up: btn1
            // KeyNavigation.down: btn3
            // [nav] --------------------------------
        }

        Button {
            id: btn3
            objectName: "[Button] button 3"
            width: parent.width
            height: (parent.height - 2*parent.spacing - 4*parent.spacing)/5
            text: "Button 3"
            highlighted: activeFocus
            // [nav] --------------------------------
            KeyNavigation.up: nextItemInFocusChain(false)
            KeyNavigation.down: nextItemInFocusChain()
            // [nav] --------------------------------
        }

        Rectangle {
            id: btn4
            objectName: "[Button] button 4"
            width: parent.width
            height: (parent.height - 2*parent.spacing - 4*parent.spacing)/5
            color: activeFocus ? "darkgray" : "dimgray"
            border {
                width: activeFocus ? 2 : 0
                color: "#ff8080"
            }

            // [nav] --------------------------------
            activeFocusOnTab: true // so that btn4 is part of the tab focus chain
            KeyNavigation.up: nextItemInFocusChain(false)
            KeyNavigation.down: nextItemInFocusChain()
            // [nav] --------------------------------

            Text {
                anchors.fill: parent
                text: "Button 4"
                color: parent.activeFocus ? "black" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            MouseArea {
                anchors.fill: parent
                onClicked: btn4.forceActiveFocus()
            }
        }

        Button {
            id: btn5
            objectName: "[Button] button 5"
            width: parent.width
            height: (parent.height - 2*parent.spacing - 4*parent.spacing)/5
            text: "Button 5"
            highlighted: activeFocus
            // [nav] --------------------------------
            KeyNavigation.up: nextItemInFocusChain(false)
            KeyNavigation.down: nextItemInFocusChain()
            // [nav] --------------------------------
        }
    }
}
