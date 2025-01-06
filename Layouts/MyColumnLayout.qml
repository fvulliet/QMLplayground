import QtQuick
import QtQuick.Layouts

Item {
    id: root

    function updateModel(index, value) {
        if (_.currentItem === 0) {
            item1.model[index].value = value;
            item1.Layout.minimumWidth = Qt.binding(function() { return item1.model[0].value; })
            item1.Layout.minimumHeight = Qt.binding(function() { return item1.model[1].value; })
            item1.Layout.preferredWidth = Qt.binding(function() { return item1.model[2].value; })
            item1.Layout.preferredHeight = Qt.binding(function() { return item1.model[3].value; })
            item1.Layout.maximumWidth = Qt.binding(function() { return item1.model[4].value; })
            item1.Layout.maximumHeight = Qt.binding(function() { return item1.model[5].value; })
            item1.Layout.fillWidth = Qt.binding(function() { return item1.model[6].value; })
            item1.Layout.fillHeight = Qt.binding(function() { return item1.model[7].value; })
        } else if (_.currentItem === 1) {
            item2.model[index].value = value;
            item2.Layout.minimumWidth = Qt.binding(function() { return item2.model[0].value; })
            item2.Layout.minimumHeight = Qt.binding(function() { return item2.model[1].value; })
            item2.Layout.preferredWidth = Qt.binding(function() { return item2.model[2].value; })
            item2.Layout.preferredHeight = Qt.binding(function() { return item2.model[3].value; })
            item2.Layout.maximumWidth = Qt.binding(function() { return item2.model[4].value; })
            item2.Layout.maximumHeight = Qt.binding(function() { return item2.model[5].value; })
            item2.Layout.fillWidth = Qt.binding(function() { return item2.model[6].value; })
            item2.Layout.fillHeight = Qt.binding(function() { return item2.model[7].value; })
        } else if (_.currentItem === 1) {
            item3.model[index].value = value;
            item3.Layout.minimumWidth = Qt.binding(function() { return item3.model[0].value; })
            item3.Layout.minimumHeight = Qt.binding(function() { return item3.model[1].value; })
            item3.Layout.preferredWidth = Qt.binding(function() { return item3.model[2].value; })
            item3.Layout.preferredHeight = Qt.binding(function() { return item3.model[3].value; })
            item3.Layout.maximumWidth = Qt.binding(function() { return item3.model[4].value; })
            item3.Layout.maximumHeight = Qt.binding(function() { return item3.model[5].value; })
            item3.Layout.fillWidth = Qt.binding(function() { return item3.model[6].value; })
            item3.Layout.fillHeight = Qt.binding(function() { return item3.model[7].value; })
        }

    }

    QtObject {
        id: _
        property int currentItem: 0
    }

    Row {
        anchors.fill: parent
        spacing: 20

        ColumnLayout {
            height: parent.height
            width: parent.width - properties.width - parent.spacing

            Rectangle {
                id: item1

                property var model: [
                    {
                        label: "Layout.minimumWidth",
                        type: 0,
                        value: 50
                    },
                    {
                        label: "Layout.minimumHeight",
                        type: 0,
                        value: -1
                    },
                    {
                        label: "Layout.preferredWidth",
                        type: 0,
                        value: 200
                    },
                    {
                        label: "Layout.preferredHeight",
                        type: 0,
                        value: 200
                    },
                    {
                        label: "Layout.maximumWidth",
                        type: 0,
                        value: -1
                    },
                    {
                        label: "Layout.maximumHeight",
                        type: 0,
                        value: -1
                    },
                    {
                        label: "Layout.fillWidth",
                        type: 1,
                        value: false
                    },
                    {
                        label: "Layout.fillHeight",
                        type: 1,
                        value: false
                    }
                ]

                color: "green"
                Layout.minimumWidth: model[0].value
                Layout.minimumHeight: model[1].value
                Layout.preferredWidth: model[2].value
                Layout.preferredHeight: model[3].value
                Layout.maximumWidth: model[4].value
                Layout.maximumHeight: model[5].value
                Layout.fillWidth: model[6].value
                Layout.fillHeight: model[7].value

                MouseArea {
                    anchors.fill: parent
                    onClicked: _.currentItem = 0;
                }
            }
            Rectangle {
                id: item2

                property var model: [
                    {
                        label: "Layout.minimumWidth",
                        value: -1
                    },
                    {
                        label: "Layout.minimumHeight",
                        value: -1
                    },
                    {
                        label: "Layout.preferredWidth",
                        value: 100
                    },
                    {
                        label: "Layout.preferredHeight",
                        value: -1
                    },
                    {
                        label: "Layout.maximumWidth",
                        value: -1
                    },
                    {
                        label: "Layout.maximumHeight",
                        value: -1
                    },
                    {
                        label: "Layout.fillWidth",
                        value: false
                    },
                    {
                        label: "Layout.fillHeight",
                        value: true
                    }
                ]

                color: "yellow"
                Layout.minimumWidth: model[0].value
                Layout.minimumHeight: model[1].value
                Layout.preferredWidth: model[2].value
                Layout.preferredHeight: model[3].value
                Layout.maximumWidth: model[4].value
                Layout.maximumHeight: model[5].value
                Layout.fillWidth: model[6].value
                Layout.fillHeight: model[7].value

                MouseArea {
                    anchors.fill: parent
                    onClicked: _.currentItem = 1;
                }
            }
            Rectangle {
                id: item3

                property var model: [
                    {
                        label: "Layout.minimumWidth",
                        value: -1
                    },
                    {
                        label: "Layout.minimumHeight",
                        value: -1
                    },
                    {
                        label: "Layout.preferredWidth",
                        value: -1
                    },
                    {
                        label: "Layout.preferredHeight",
                        value: -1
                    },
                    {
                        label: "Layout.maximumWidth",
                        value: -1
                    },
                    {
                        label: "Layout.maximumHeight",
                        value: -1
                    },
                    {
                        label: "Layout.fillWidth",
                        value: true
                    },
                    {
                        label: "Layout.fillHeight",
                        value: true
                    }
                ]

                color: "red"
                Layout.minimumWidth: model[0].value
                Layout.minimumHeight: model[1].value
                Layout.preferredWidth: model[2].value
                Layout.preferredHeight: model[3].value
                Layout.maximumWidth: model[4].value
                Layout.maximumHeight: model[5].value
                Layout.fillWidth: model[6].value
                Layout.fillHeight: model[7].value

                MouseArea {
                    anchors.fill: parent
                    onClicked: _.currentItem = 2;
                }
            }
        }

        Rectangle {
            id: properties

            height: parent.height
            width: 200
            color: {
                if (_.currentItem === 0)
                    return item1.color;
                if (_.currentItem === 1)
                    return item2.color;
                return item3.color;
            }

            ListView {
                id: propertiesModel
                anchors.fill: parent
                anchors.margins: 4
                clip: true
                model: {
                    if (_.currentItem === 0)
                        return item1.model;
                    if (_.currentItem === 1)
                        return item2.model;
                    return item3.model;
                }
                delegate: Item {
                    id: del
                    required property var modelData
                    required property int index
                    width: propertiesModel.width
                    height: propertiesModel.height/propertiesModel.count

                    Rectangle {
                        radius: 5
                        anchors {
                            fill: parent
                            margins: 5
                        }

                        Column {
                            anchors.fill: parent
                            spacing: 0

                            Item {
                                width: parent.width; height: (parent.height-parent.spacing)/2

                                Text {
                                    anchors.fill: parent
                                    font.pixelSize: 16
                                    text: del.modelData.label
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            Item {
                                width: parent.width; height: (parent.height-parent.spacing)/2

                                TextInput {
                                    visible: del.modelData.type === 0
                                    anchors.fill: parent
                                    font {
                                        pixelSize: 24
                                        bold: true
                                    }
                                    text: del.modelData.value
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    onAccepted: {
                                        del.modelData.value = text;
                                        root.updateModel(del.index, text)
                                    }
                                }

                                Rectangle {
                                    visible: del.modelData.type === 1
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    color: del.modelData.value ? "lightgray" : "white"

                                    Text {
                                        anchors.fill: parent
                                        text: del.modelData.value
                                        font {
                                            pixelSize: 24
                                            bold: true
                                        }
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            del.modelData.value = !del.modelData.value;
                                            root.updateModel(del.index, del.modelData.value)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
