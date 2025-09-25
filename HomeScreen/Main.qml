import QtQuick
import QtQuick.Layouts

Window {
    id: root

    property int currentWorkspace: 0
    property var workspacesModel: [
        {
            name: "Aaa",
            actions: ["action-A1", "action-A2", "action-A3"],
            quickAccessControlModel: ["A-QA1", "A-QA2"],
            loadee: Qt.resolvedUrl("./WorkspaceA.qml"),
            coord: [0,0]
        },
        {
            name: "Bbb",
            actions: ["action-B1", "action-B2"],
            quickAccessControlModel: ["B-QA1", "B-QA2", "B-QA3"],
            loadee: Qt.resolvedUrl("./WorkspaceB.qml"),
            coord: [0,1]
        },
        {
            name: "Ccc",
            quickAccessControlModel: [],
            loadee: Qt.resolvedUrl("./WorkspaceC.qml"),
            coord: [1,0]
        },
        {
            name: "Ddd",
            actions: ["action-D1", "action-D2", "action-D3", "action-D4"],
            quickAccessControlModel: ["D-QA1"],
            loadee: Qt.resolvedUrl("./WorkspaceD.qml"),
            coord: [1,1]
        }
    ]
    property bool expanded: false
    property bool isOption1 : true
    readonly property int _statusBarHeight: 50
    property bool _shuffling: false

    width: 960
    height: 1280
    visible: true
    title: qsTr("HomeScreen")

    Column {
        anchors.fill: parent

        StatusBar {
            id: statusBar
            width: parent.width
            height: root._statusBarHeight
        }
        Item {
            id: payload
            width: parent.width
            height: parent.height - root._statusBarHeight

            // option 1
            GridLayout {
                id: grid

                visible: isOption1
                anchors.fill: parent
                columns: 2
                rows: 2
                columnSpacing: 16
                rowSpacing: 16

                Repeater {
                    model: root.workspacesModel
                    delegate: Item {
                        id: myDel
                        required property var modelData
                        required property int index

                        Layout.row: root.expanded ? 0 : myDel.modelData.coord[0]
                        Layout.column: root.expanded ? 0 : myDel.modelData.coord[1]
                        Layout.rowSpan: 1
                        Layout.columnSpan: 1
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        visible: !expanded || (root.expanded && root.currentWorkspace === myDel.index)

                        Workspace {
                            anchors {
                                fill: parent
                                margins: 8
                            }
                            label: myDel.modelData.name
                            selected: myDel.index === currentWorkspace
                            quickAccessControlModel: myDel.modelData.quickAccessControlModel
                            shuffling: root._shuffling

                            onClicked: {
                                if (root._shuffling)
                                    return;

                                if (!root.expanded && currentWorkspace !== myDel.index) {
                                    currentWorkspace = myDel.index;
                                } else {
                                    root.expanded = true;
                                }
                            }
                        }
                    }
                }
            }
            // end of option 1

            // option 2
            Loader {
                id: workspaceLoader
                visible: !isOption1
                anchors {
                    fill: parent
                    margins: 8
                }
                source: workspacesModel[currentWorkspace].loadee
            }
            // end of option 2

            QuickAccessControl {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: parent.height/5
                }
                visible: isOption1 && !root.expanded && !_shuffling
                height: 64
                customActions: ["search", "create QS", "create event"]
                onActionClicked: (idx) => console.log("-----actionClicked", customActions[idx])
            }
        }
    }

    ControlBar {
        id: controlBar
        height: expanded ? parent.height : root._statusBarHeight
        width: 100
        showHome: isOption1 && root.expanded
        isOption1: root.isOption1
        navigation: isOption1 ? [] : ["Aaa", "Bbb", "Ccc", "Ddd"]
        customActions: workspacesModel[currentWorkspace].actions
        onHomeClicked: root.expanded = false

        onNavigationClicked: (index) => {
            currentWorkspace = index;
        }
        onHamburgerClicked: {
            controlBar.expanded = !controlBar.expanded;
        }
        onShuffleClicked: {
            root._shuffling = !root._shuffling;
        }
    }
}
