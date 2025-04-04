import QtQuick

Column {
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
