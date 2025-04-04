import QtQuick
import QtQuick.Layouts

FocusScope {
    id: root

    ListModel {
        id: fruitModel

        ListElement {
            name: "Apple"
            fruitColor: "green"
        }
        ListElement {
            name: "Banana"
            fruitColor: "yellow"
        }
        ListElement {
            name: "Blueberry"
            fruitColor: "purple"
        }
        ListElement {
            name: "Strawberry"
            fruitColor: "red"
        }
    }

    ListModel {
        id: peopleModel

        ListElement {
            name: "John"
            age: "42"
        }
        ListElement {
            name: "Mary"
            age: "25"
        }
        ListElement {
            name: "Steve"
            age: "33"
        }
        ListElement {
            name: "Helen"
            age: "58"
        }
    }

    RowLayout {
        id: row
        anchors.fill: parent
        Component.onCompleted: console.log("-----Page3 RowLayout activeFocus", row.activeFocus)

        ListView {
            id: fruitList
            focus: true
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width/3
            model: fruitModel
            interactive: false
            delegate: Rectangle {
                id: fruitDel

                required property string name
                required property string fruitColor
                required property int index

                color: fruitColor
                width: fruitList.width
                height: 60
                border.width: fruitList.currentIndex === index ? 3 : 0

                Text {
                    id: fruitTxt
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: fruitDel.name
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: fruitList.currentIndex = fruitDel.index
                }
            }
        }
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ListView {
            id: peopleList
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width/3
            model: peopleModel
            interactive: false
            delegate: Rectangle {
                id: peopleDel

                required property string name
                required property int age
                required property int index

                width: peopleList.width
                height: 90
                border.color: peopleList.currentIndex === index ? "red" : "black"
                border.width: peopleList.currentIndex === index ? 3 : 1

                MouseArea {
                    anchors.fill: peopleCol
                    onClicked: peopleList.currentIndex = peopleDel.index
                }

                ColumnLayout {
                    id: peopleCol
                    anchors.fill: parent

                    Text {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        text: peopleDel.name
                    }
                    Text {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: peopleDel.age
                    }
                }
            }
        }
    }
}
