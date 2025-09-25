import QtQuick

Rectangle {
    id: root

    property alias label: txt.text
    property bool selected: false
    property var quickAccessControlModel
    property bool shuffling: false

    signal clicked()
    signal upClicked()
    signal downClicked()
    signal leftClicked()
    signal rightClicked()

    color: "transparent"
    border {
        width: shuffling || selected ? 4 : 0
        color: "black"
    }

    Text {
        id: txt
        anchors {
            fill: parent
            margins: 8
        }
        font.pixelSize: Math.min(64, height/2)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }

    Rectangle {
        visible: shuffling
        anchors.right: parent.right
        color: "black"
        height: 50
        width: 3 * height

        Row {
            anchors.fill: parent

            ShuffleKey {
                width: parent.width / 4
                text: "U"
                onClicked: upClicked();
            }
            ShuffleKey {
                width: parent.width / 4
                text: "D"
                onClicked: downClicked();
            }
            ShuffleKey {
                width: parent.width / 4
                text: "L"
                onClicked: leftClicked();
            }
            ShuffleKey {
                width: parent.width / 4
                text: "R"
                onClicked: rightClicked();
            }
        }
    }

    QuickAccessControl {
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: parent.height/5
        }
        height: 32
        customActions: root.quickAccessControlModel
        visible: customActions.length > 0
    }

    component ShuffleKey: Text {
        signal clicked

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 16
        color: "white"
        height: parent.height

        MouseArea {
            anchors.fill: parent
            onClicked: parent.clicked()
        }
    }
}
