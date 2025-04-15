import QtQuick
import QtQuick.Layouts

// [nav] --------------------------------
FocusScope {
// [nav] --------------------------------
    id: root
    objectName: "[FocusScope] Page3"

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
        objectName: "[RowLayout] Page3_row"
        anchors {
            fill: parent
            margins: 20
        }

        ListView {
            id: fruitList
            objectName: "[ListView] fruitlist"

            readonly property int fruitHeight: 60

            Layout.preferredHeight: count*fruitHeight
            Layout.preferredWidth: parent.width/4
            Layout.alignment: Qt.AlignTop
            model: fruitModel
            interactive: false
            delegate: Rectangle {
                id: fruitDel
                objectName: "[Rectangle delegate] fruitDel"

                required property string name
                required property string fruitColor
                required property int index
                property int myBorder: 3

                border.width: fruitList.currentIndex === index ? myBorder : 0
                color: "transparent"
                width: fruitList.width
                height: fruitList.fruitHeight

                Rectangle {
                    anchors {
                        fill: parent
                        margins: fruitDel.myBorder
                    }
                    color: fruitDel.fruitColor

                    Text {
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: fruitDel.name
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: fruitList.currentIndex = fruitDel.index
                }
            }
            // [nav] --------------------------------
            Keys.onUpPressed:   decrementCurrentIndex()
            Keys.onDownPressed: incrementCurrentIndex()
            KeyNavigation.tab: peopleList
            // [nav] --------------------------------

            Rectangle {
                anchors.fill: fruitList
                color: "transparent"
                border {
                    width: fruitList.activeFocus ? 2 : 0
                    color: "red"
                }
            }
        }
        Item {
            // spacer
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ListView {
            id: peopleList
            objectName: "[ListView] peopleList"

            readonly property int peopleHeight: 90

            // [nav] --------------------------------
            focus: true // in the FocusScope, peopleList is given the focus by default
            // [nav] --------------------------------
            Layout.preferredHeight: count*peopleHeight
            Layout.preferredWidth: parent.width/4
            Layout.alignment: Qt.AlignTop
            model: peopleModel
            interactive: false
            delegate: Rectangle {
                id: peopleDel
                objectName: "[Rectangle delegate] peopleDel"

                required property string name
                required property int age
                required property int index

                width: peopleList.width
                height: peopleList.peopleHeight
                border.color: peopleList.currentIndex === index ? "red" : "black"
                border.width: peopleList.currentIndex === index ? 4 : 1

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
            // [nav] --------------------------------
            Keys.onUpPressed:   decrementCurrentIndex()
            Keys.onDownPressed: incrementCurrentIndex()
            KeyNavigation.tab: fruitList
            // [nav] --------------------------------

            Rectangle {
                anchors.fill: peopleList
                color: "transparent"
                border {
                    width: peopleList.activeFocus ? 2 : 0
                    color: "red"
                }
            }
        }
    }
}
