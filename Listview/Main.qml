import QtQuick

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        color: "lightblue"
        height: 500; width: 500
        anchors.centerIn: parent

        ListView {
            id: myView
            height: parent.height
            width: contentItem.childrenRect.width
            anchors.centerIn: parent
            orientation: ListView.Horizontal
            interactive: false
            model: ["short", "medium size", "very long size"]
            delegate: Item {
                id: myDel
                property bool selected: ListView.view.currentIndex === index

                width: innerRect.width; height: ListView.view.height

                Rectangle {
                    id: innerRect
                    color: myDel.selected ? "lightpink" : "lightyellow"
                    height: myView.height/3; width: myText.implicitWidth
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        id: myText
                        height: parent.height
                        font.pixelSize: 28
                        text: modelData
                        verticalAlignment: Qt.AlignVCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: myView.currentIndex = index
                    }
                }
            }
        }
    }
}
