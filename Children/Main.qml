import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    MyComponent {
        id: myComp

        Rectangle {
            id: item3
            height: 100
            width: 100
            color: "yellow"
        }
    }

    Component.onCompleted: console.log("-----", myComp.children)
}
