import QtQuick

Window {
    id: root
    objectName: "root"
    width: 1280
    height: 960
    visible: true
    title: qsTr("navigation")

    ListView {
        id: rep
        anchors.fill: parent
        focus: true
        model: ["./Page0.qml","./Page1.qml", "./Page2.qml"]
        //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        delegate: Loader {
            width: root.width
            height: 960/3
            required property var modelData
            source: modelData
            focus: ListView.isCurrentItem

            onFocusChanged: {
                console.log("focus", focus, item)
                item.focus = focus
            }
        }
    }

}
