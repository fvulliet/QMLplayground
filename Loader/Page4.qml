import QtQuick

// one Loader that loads a huge component, a GridView for instance

Item {
    id: root

    property double _startTime: new Date().getTime()
    property double _endTime
    property int _nbItems: 1000
    property var _myModel: []

    function setModel() {
        root._myModel = [];
        for (let i=0; i<root._nbItems; ++i) {
            root._myModel.push({
                id: i,
                label: "index: " + i.toString()
            });
        }
        myLoader.item.model = root._myModel;
        _endTime = new Date().getTime();
    }

    on_NbItemsChanged: setModel();

    Row {
        anchors.fill: parent

        Column {
            id: sideBar
            height: parent.height
            width: 100

            Column {
                width: parent.width
                height: parent.height/4

                Text {
                    width: parent.width
                    height: parent.height/3
                    text: "+"
                    font.pixelSize: height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (root._nbItems < 100000) {
                                _startTime = 0;
                                _startTime = new Date().getTime();
                                root._nbItems *= 10;
                            }
                        }
                    }
                }
                Text {
                    width: parent.width
                    height: parent.height/3
                    text: root._nbItems + " items"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    width: parent.width
                    height: parent.height/3
                    text: "-"
                    font.pixelSize: height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (root._nbItems > 10) {
                                _startTime = 0;
                                _startTime = new Date().getTime();
                                root._nbItems /= 10;
                            }
                        }
                    }
                }
            }
            Item {
                width: parent.width
                height: parent.height/4

                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width-10
                    height: width
                    radius: 5
                    color: "lightgray"

                    Text {
                        anchors.fill: parent
                        text: "toggle\nvisible"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            _startTime = 0;
                            _startTime = new Date().getTime();
                            if (myLoader.visible) {
                                myLoader.visible = false;
                            } else {
                                myLoader.visible = true;
                                _endTime = new Date().getTime();
                            }
                        }
                    }
                }
            }
            Item {
                width: parent.width
                height: parent.height/4

                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width-10
                    height: width
                    radius: 5
                    color: "lightgray"

                    Text {
                        anchors.fill: parent
                        text: "toggle\nactive"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            _startTime = 0;
                            _startTime = new Date().getTime();
                            if (myLoader.item?.count > 0) {
                                myLoader.active = false;
                            } else {
                                myLoader.active = true;
                            }
                        }
                    }
                }
            }
            Item {
                width: parent.width
                height: parent.height/4

                Text {
                    anchors.fill: parent
                    text: {
                        if (_startTime === 0) {
                            return "";
                        }
                        return _endTime - _startTime + "ms"
                    }
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
        Loader {
            id: myLoader
            height: parent.height
            width: parent.width - sideBar.width
            sourceComponent: myComp
            onLoaded: {
                myLoader.item.cellWidth = myLoader.width/10;
                myLoader.item.cellHeight = myLoader.item.cellWidth;
                root.setModel();
            }
        }
    }

    Component {
        id: myComp

        GridView {
            id: grid

            clip: true
            boundsBehavior: Flickable.StopAtBounds
            delegate: Item {
                id: del

                required property int index
                required property var modelData

                width: GridView.view.cellWidth
                height: GridView.view.cellHeight

                Rectangle {
                    anchors {
                        fill: parent
                        margins: 2
                    }
                    border.width: 1

                    Column {
                        anchors.fill: parent
                        spacing: 5

                        Row {
                            width: parent.width
                            height: (parent.height-parent.spacing)/2

                            Item {
                                height: parent.height
                                width: parent.width/2

                                Image {
                                    anchors {
                                        fill: parent
                                        margins: 2
                                    }
                                    source: Qt.resolvedUrl("./qt.jpg")
                                    fillMode: Image.PreserveAspectFit
                                }
                            }
                            Text {
                                height: parent.height
                                width: parent.width/2
                                text: del.modelData.id
                                font.pixelSize: height/1.5
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignBottom
                            }
                        }

                        Text {
                            width: parent.width
                            height: (parent.height-parent.spacing)/2
                            text: del.modelData.label
                            font {
                                bold: true
                                pixelSize: height/3
                            }
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignTop
                        }
                    }
                }
            }
        }
    }
}
