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
    title: qsTr("Tab Navigation")

    Column {
        anchors.fill: parent

        MenuBar {
            id: header
            width: parent.width; height: 100
            orientation: ListView.Horizontal
            currentSelection: 0
            tabs: root.pages
        }

        Item {
            width: parent.width; height: parent.height - parent.spacing - header.height

            Loader {
                id: loader
                focus: true
                anchors {
                    fill: parent
                    margins: 10
                }
                source: root.pages[header.currentSelection].url
                Component.onCompleted: console.log("-----Loader activeFocus", loader.activeFocus)
                onLoaded: {
                    item.focus = true;
                    console.log("-----Loadee activeFocus", item.activeFocus)
                }
            }
        }
    }
}
