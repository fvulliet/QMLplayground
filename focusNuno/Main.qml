import QtQuick

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("focus nuno")

    Loader {
        objectName: "loader"
        anchors.fill: parent
        focus: true // this is required so that the focus can be given to the loaded component (be it loaded with source or sourceComponent)
        source: Qt.resolvedUrl("./Toto.qml")
        //sourceComponent: toto
        onLoaded: {
            item.focus = true // this is required so that the focus can be given to the loaded component (be it loaded with source or sourceComponent)
        }
    }

    Rectangle {
        anchors.fill: activeFocusTxt
        color: "white"
    }

    Text {
        id: activeFocusTxt
        text: root.activeFocusItem.objectName
        font.pixelSize: 40
        anchors.centerIn: parent
    }

    Component {
        id: toto
        FocusScope {
            //focus: true
            objectName: "FC"
            Rectangle {
                id: red
                objectName: "redRect"
                width: parent.width
                height: parent.height/2
                color: "red"

                MouseArea {
                    anchors.fill: parent
                    onClicked: red.focus = true;
                }
            }
            Rectangle {
                id: blue
                objectName: "blueRect"
                anchors.top: red.bottom
                width: parent.width
                height: parent.height/2
                color: "blue"
                focus: true

                MouseArea {
                    anchors.fill: parent
                    onClicked: blue.focus = true;
                }
            }
        }
    }
}
