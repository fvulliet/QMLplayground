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
        }
    ]

    width: 1280
    height: 960
    visible: true
    title: qsTr("Keyboard Navigation")

    onActiveFocusItemChanged: console.log("-----activeFocusItem:", activeFocusItem)

    Row {
        objectName: "[Row] main row"
        anchors.fill: parent

        MenuBar {
            id: header
            objectName: "[MenuBar] header"
            height: parent.height
            width: 200
            orientation: ListView.Vertical
            currentSelection: 0
            tabs: root.pages
            // [nav] --------------------------------
            focus: true
            // [nav] --------------------------------
        }

        Loader {
            id: loader
            objectName: "[Loader] loader"
            height: parent.height
            width: parent.width - parent.spacing - header.width
            source: root.pages[header.currentSelection].url
            // [nav] --------------------------------
            onLoaded: item.focus = true; // necessary for Page2, which is not based on Controls
            // [nav] --------------------------------
        }
    }
}
