import QtQuick

Window {
    id: root

    property var pages: [
        {
            label: "Page1",
            url: "./Page1.qml"
        },
        {
            label: "Page2",
            url: "./Page2.qml"
        },
        {
            label: "Page3",
            url: "./Page3.qml"
        }
    ]

    width: 1280
    height: 960
    visible: true
    title: qsTr("Keyboard Navigation")

    onActiveFocusItemChanged: console.log("-----activeFocusItem", activeFocusItem, activeFocusItem.objectName)

    Row {
        anchors.fill: parent

        MenuBar {
            id: header
            height: parent.height; width: 200
            orientation: ListView.Vertical
            currentSelection: 0
            tabs: root.pages
            focus: true
            KeyNavigation.tab: loader
        }

        Item {
            height: parent.height; width: parent.width - parent.spacing - header.width

            Loader {
                id: loader
                anchors {
                    fill: parent
                    margins: 10
                }
                source: root.pages[header.currentSelection].url
                onLoaded: item.focus = true;
            }
            KeyNavigation.tab: header
        }
    }
}
