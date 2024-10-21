import QtQuick

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("pathview")

    property int selectedIndex
    property var list: Array.from({length: 30}, (e, i) => "index" + i)
    property string selectedText: selectedIndex >= 0 ? list[selectedIndex] : ""
    property int maxVisible: 5

    Component.onCompleted: selectedIndex = 15; // index15

    Row {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 20

        Item {
            height: parent.height
            width: (parent.width-parent.spacing)/2

            Rectangle {
                anchors.bottom: container.top
                color: mouseAreaTop.pressed ? "lightgray" : "black"
                height: 30; width: height
                radius: width/2
                anchors.horizontalCenter: container.horizontalCenter

                MouseArea {
                    id: mouseAreaTop
                    anchors.fill: parent
                    onClicked: {
                        if (selectedIndex >= maxVisible)
                            selectedIndex -= maxVisible;
                        else
                            selectedIndex = myPathView.count - maxVisible + selectedIndex;
                    }
                }
            }
            Rectangle {
                id: container

                property real itemHeight: height/maxVisible

                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                border.width: 2
                width: Math.min(parent.width, parent.height)
                height: width
                clip: true

                Item {
                    width: parent.width*80/100
                    height: container.itemHeight
                    anchors.centerIn: parent

                    Rectangle {
                        anchors.top: parent.top
                        width: parent.width
                        height: 2
                        color: "black"
                    }
                    Rectangle {
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 2
                        color: "black"
                    }
                }

                PathView {
                    id: myPathView

                    signal newValue()

                    model: list
                    anchors.fill: parent
                    highlightMoveDuration: 0
                    snapMode: PathView.SnapOneItem
                    currentIndex: selectedIndex
                    pathItemCount: maxVisible
                    preferredHighlightBegin: 0.5 // used to center the selected item
                    preferredHighlightEnd: 0.5 // used to center the selected item
                    highlightRangeMode: PathView.StrictlyEnforceRange
                    delegate: Item {
                        required property var modelData
                        required property int index

                        width: myPathView.width
                        height: container.itemHeight

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: height/2
                            text: modelData

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    selectedIndex = index
                                }
                            }
                        }
                    }
                    path: Path {
                        startX: myPathView.width/2
                        startY: 0

                        PathLine {
                            x: myPathView.width/2
                            y: myPathView.height
                        }
                    }
                }
            }
            Rectangle {
                anchors.top: container.bottom
                color: mouseAreaBottom.pressed ? "lightgray" : "black"
                height: 30; width: height
                radius: width/2
                anchors.horizontalCenter: container.horizontalCenter

                MouseArea {
                    id: mouseAreaBottom
                    anchors.fill: parent
                    onClicked: {
                        selectedIndex = (selectedIndex + maxVisible) % myPathView.count;
                    }
                }
            }
        }
        Item {
            height: parent.height
            width: (parent.width-parent.spacing)/2

            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                height: 100
                width: parent.width
                border.width: 2

                Text {
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: height/1.5
                    text: selectedText
                }
            }
        }
    }
}
