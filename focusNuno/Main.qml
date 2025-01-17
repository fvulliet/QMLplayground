import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("focus nuno")

    onActiveFocusItemChanged: console.log("-----", activeFocusItem.objectName)

    Loader {
        anchors.fill: parent
        objectName: "loader"
        focus: true
        source: Qt.resolvedUrl("./Toto.qml")
        //sourceComponent: toto
        onLoaded: item.focus = true
    }

    Component {
        id: toto
        FocusScope {
            //focus: true
            objectName: "FC"
            Rectangle {
                id: top
                objectName: "rect1"
                width: parent.width
                height: parent.height/2
                color: "red"
            }
            Rectangle {
                objectName: "rect2"
                anchors.top: top.bottom
                width: parent.width
                height: parent.height/2
                color: "blue"
                focus: true

                MouseArea {
                    anchors.fill: parent
                    onClicked: top.focus = true;
                }
            }
        }
    }
}
