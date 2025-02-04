import QtQuick

Window {
    id: root
    width: 1280
    height: 960
    visible: true
    title: qsTr("Loader")

    function toggleBlueLoader() {
        loaderBlue.visible = !loaderBlue.visible;
    }

    function toggleYellowLoader() {
        loaderYellow.visible = !loaderYellow.visible;
    }

    function toggleBlueLoadee() {
        loaderBlue.item.visible = !loaderBlue.item.visible;
    }

    function toggleYellowLoadee() {
        loaderYellow.item.visible = !loaderYellow.item.visible;
    }

    Column {
        anchors.fill: parent

        Rectangle {
            id: top
            width: parent.width
            height: 100

            Row {
                anchors.fill: parent

                Item {
                    height: parent.height
                    width: parent.width/4

                    Rectangle {
                        height: parent.height-2*10
                        width: height*2
                        anchors.centerIn: parent
                        color: "lightGray"

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "toggle B loader\nvisibility"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.toggleBlueLoader()
                            }
                        }
                    }
                }
                Item {
                    height: parent.height
                    width: parent.width/4

                    Rectangle {
                        height: parent.height-2*10
                        width: height*2
                        anchors.centerIn: parent
                        color: "lightGray"

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "toggle Y loader\nvisibility"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.toggleYellowLoader()
                            }
                        }
                    }
                }
                Item {
                    height: parent.height
                    width: parent.width/4

                    Rectangle {
                        height: parent.height-2*10
                        width: height*2
                        anchors.centerIn: parent
                        color: "lightGray"

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "toggle B loadee\nvisibility"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.toggleBlueLoadee()
                            }
                        }
                    }
                }
                Item {
                    height: parent.height
                    width: parent.width/4

                    Rectangle {
                        height: parent.height-2*10
                        width: height*2
                        anchors.centerIn: parent
                        color: "lightGray"

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "toggle Y loadee\nvisibility"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.toggleYellowLoadee()
                            }
                        }
                    }
                }
            }
        }
        Row {
            width: parent.width
            height: parent.height - top.height

            Loader {
                id: loaderBlue
                height: parent.height
                width: parent.width/2
                sourceComponent: Rectangle {
                    color: "blue"
                }
            }
            Loader {
                id: loaderYellow
                height: parent.height
                width: parent.width/2
                sourceComponent: Rectangle {
                    color: "yellow"
                }
            }
        }
    }
}
