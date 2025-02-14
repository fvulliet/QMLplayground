import QtQuick

Window {
    id: root

    property var pages: [
        {
            label: "visibility",
            url: "./Page1.qml"
        },
        {
            label: "focus",
            url: "./Page2.qml"
        },
        {
            label: "size",
            url: "./Page3.qml"
        },
        {
            label: "perf 1",
            url: "./Page4.qml"
        },
        {
            label: "perf 2",
            url: "./Page5.qml"
        }
    ]

    width: 1280
    height: 960
    visible: true
    title: qsTr("Loader")

    Column {
        anchors.fill: parent
        spacing: 20

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
                anchors {
                    fill: parent
                    margins: 10
                }
                source: root.pages[header.currentSelection].url
            }
        }
    }

}
