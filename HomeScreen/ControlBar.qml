import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property bool showHome: false
    property bool isOption1: true
    property bool expanded: true
    readonly property int _itemHeight: 50

    signal homeClicked
    signal navigationClicked(int index)
    signal hamburgerClicked
    signal shuffleClicked

    property var customActions: []
    property var navigation: []

    border.width: 1

    MouseArea { // to eat the key presses
        anchors.fill: parent
    }

    ListModel {
        id: staticActions

        ListElement {
            name: "Trash"
        }
        ListElement {
            name: "Guide"
        }
        ListElement {
            name: "Settings"
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 32

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: expanded ? root._itemHeight : parent.height

            Column {
                height: parent.height/2
                width: height
                anchors.centerIn: parent
                spacing: 4

                Repeater {
                    id: stripesRepeater
                    model: 3
                    delegate: Rectangle {
                        width: parent.width
                        height: (parent.height - (stripesRepeater.count-1) * parent.spacing)/stripesRepeater.count
                        color: "black"
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: root.hamburgerClicked()
            }
        }

        Text {
            visible: expanded
            Layout.fillWidth: true
            Layout.preferredHeight: root._itemHeight
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Shuffle"
            font.pixelSize: 16

            MouseArea {
                anchors.fill: parent
                onClicked: root.shuffleClicked()
            }
        }

        Action {
            id: home
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height/20
            label: "Home"
            visible: root.showHome && expanded
            onActionClicked: root.homeClicked()
        }

        ListView {
            id: navigationList
            visible: !isOption1 && expanded
            Layout.fillWidth: true
            Layout.preferredHeight: contentHeight
            interactive: false
            model: navigation
            orientation: ListView.Vertical
            delegate: Action {
                required property int index
                required property var modelData
                width: list.width
                height: root.height/20
                label: modelData
                onActionClicked: {
                    root.navigationClicked(index)
                }
            }
        }

        Separator {
            id: sep1
            visible: !isOption1 && customActions?.length > 0 && expanded
            Layout.alignment: Qt.AlignHCenter
        }

        ListView {
            id: customActionsList
            visible: expanded
            Layout.fillWidth: true
            Layout.preferredHeight: contentHeight
            interactive: false
            model: customActions
            orientation: ListView.Vertical
            delegate: Action {
                width: list.width
                height: root.height/20
                label: modelData
            }
        }

        Separator {
            visible: !isOption1 && customActions?.length > 0 && expanded
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: expanded
        }

        ListView {
            id: list
            visible: expanded
            Layout.fillWidth: true
            Layout.preferredHeight: contentHeight
            interactive: false
            model: staticActions
            orientation: ListView.Vertical
            delegate: Action {
                width: list.width
                height: root.height/20
                label: name
            }
        }
    }

    component Separator: Rectangle {
        Layout.preferredWidth: root.width * 0.75
        Layout.preferredHeight: 1
        color: "black"
    }
}
