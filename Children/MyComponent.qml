import QtQuick

FocusScope {
    Rectangle {
        id: item1
        width: 100
        height: 100
        color: "red"
    }
    Rectangle {
        id: item2
        width: 100
        height: 100
        color: "blue"
        anchors.top: item1.bottom
    }
    Rectangle {
        id: item3
        width: 100
        height: 100
        color: "green"
        anchors.top: item2.bottom
    }
}
