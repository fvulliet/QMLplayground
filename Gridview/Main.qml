import QtQuick

Window {
    id: root

    width: 1280
    height: 960
    visible: true
    title: qsTr("Gridview")

    property int currentSelection: 1

    Column {
        anchors.fill: parent
        spacing: 20

        Row {
            id: buttonsRow
            width: parent.width; height: (parent.height-parent.spacing)/5

            Rectangle {
                height: parent.height; width: parent.width/3
                color: root.currentSelection === 0 ? "#E1E2EC" : "white"

                ButtonComp {
                    width: parent.width/3; height: width/3
                    label: "small"
                    anchors.centerIn: parent
                    selected: root.currentSelection === 0
                    onClicked: root.currentSelection = 0
                }
            }
            Rectangle {
                height: parent.height; width: parent.width/3
                color: root.currentSelection === 1 ? "#E1E2EC" : "white"

                ButtonComp {
                    width: parent.width/3; height: width/3
                    label: "medium"
                    anchors.centerIn: parent
                    selected: root.currentSelection === 1
                    onClicked: root.currentSelection = 1
                }
            }
            Rectangle {
                height: parent.height; width: parent.width/3
                color: root.currentSelection === 2 ? "#E1E2EC" : "white"

                ButtonComp {
                    width: parent.width/3; height: width/3
                    label: "large"
                    anchors.centerIn: parent
                    selected: root.currentSelection === 2
                    onClicked: root.currentSelection = 2
                }
            }
        }

        Item {
            width: parent.width; height: (parent.height-parent.spacing)*4/5

            GridView {
                id: gridview
                anchors {
                    fill: parent
                    margins: 20
                }
                clip: true
                cellWidth: {
                    switch (root.currentSelection) {
                    case 0:
                        return width/8;
                    case 1:
                        return width/6;
                    }
                    return width/4;
                }
                cellHeight: 2*cellWidth
                boundsBehavior: Flickable.StopAtBounds
                model: 42
                delegate: Item {
                    id: del
                    required property int modelData
                    width: gridview.cellWidth
                    height: gridview.cellHeight

                    Rectangle {
                        border {
                            width: 2
                            color: "#2E2E2E"
                        }
                        anchors {
                            fill: parent
                            margins: 10
                        }
                        Text {
                            id: txt
                            anchors.fill: parent
                            font.pixelSize: height/3
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            color: "#2E2E2E"
                            text: del.modelData
                        }
                    }
                }
            }
        }
    }

    component ButtonComp :Rectangle {
        id: btnComp

        property alias label: txt.text
        property bool selected: false

        signal clicked()

        border {
            color: "#2E2E2E"
            width: btnComp.selected ? 3 : 1
        }

        radius: 5
        color: "#F1F2FC"

        Text {
            id: txt
            anchors.fill: parent
            font.pixelSize: height/3
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#2E2E2E"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: btnComp.clicked()
        }
    }
}
