import QtQuick

// one Gridview width a Loader in its delegate

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
        grid.model = _myModel;
        _endTime = new Date().getTime();
    }

    on_NbItemsChanged: setModel();

    Component.onCompleted: setModel();

    Row {
        anchors.fill: parent

        Column {
            id: sideBar
            height: parent.height
            width: 100

            Column {
                width: parent.width
                height: parent.height/3

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
                height: parent.height/3

                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width-10
                    height: width
                    radius: 5
                    color: "lightgray"

                    Text {
                        anchors.fill: parent
                        text: "toggle\nmodel"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            _startTime = 0;
                            _startTime = new Date().getTime();
                            if (grid.model.length > 0) {
                                grid.model = [];
                            } else {
                                grid.model = _myModel;
                            }
                        }
                    }
                }
            }
            Item {
                width: parent.width
                height: parent.height/3

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
        GridView {
            id: grid
            height: parent.height
            width: parent.width - sideBar.width
            clip: true
            cellWidth: width/20
            cellHeight: cellWidth
            boundsBehavior: Flickable.StopAtBounds
            delegate: Loader {
                id: del

                required property int index
                required property var modelData

                width: grid.cellWidth
                height: grid.cellHeight
                sourceComponent: myComp
                onLoaded: {
                    item.myId = del.modelData.id;
                    item.myLabel = del.modelData.label;
                    _endTime = new Date().getTime();
                }
            }
        }
    }

    Component {
        id: myComp

        Item {
            id: myLoadee

            property int myId
            property string myLabel

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
                            text: myLoadee.myId
                            font.pixelSize: height/1.5
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignBottom
                        }
                    }
                    Text {
                        width: parent.width
                        height: (parent.height-parent.spacing)/2
                        text: myLoadee.myLabel
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
