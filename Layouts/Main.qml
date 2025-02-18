import QtQuick

Window {
    id: root

    property var pages: [
        {
            label: "ColumnLayout",
            url: "./Page1.qml"
        },
        {
            label: "RowLayout",
            url: "./Page2.qml"
        },
        {
            label: "GridLayout",
            url: "./Page3.qml"
        },
        {
            label: "\"TopDown\"",
            url: "./Page4.qml"
        },
        {
            label: "\"TopDown2\"",
            url: "./Page5.qml"
        }
    ]

    width: 1280
    height: 960
    visible: true
    title: qsTr("Layouts")

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
