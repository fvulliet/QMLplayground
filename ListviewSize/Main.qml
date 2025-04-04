import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("my fruit model")

    ListModel {
        id: fruitModel

        ListElement {
            name: "Apple"
        }
        ListElement {
            name: "Orange"
        }
        ListElement {
            name: "Banana"
        }
    }

    Rectangle {
        width: parent.width/2
        height: parent.height/2
        anchors.centerIn: parent
        border.width: 1

        ListView {
            id: list
            // --------------------
            // USING WIDTH
            width: parent.width
            // USING WIDTH + HEIGHT
            // anchors.fill: parent
            // anchors.margins: 2
            // --------------------
            model: fruitModel
            delegate: MyFruit {
                width: ListView.view.width
                myName: model.name
            }
        }
    }

    component MyFruit: Rectangle {
        property alias myName: txt.text
        implicitHeight: 50
        color: "lightblue"
        Text {
            id: txt
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
