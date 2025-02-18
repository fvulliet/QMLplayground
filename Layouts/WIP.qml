import QtQuick
import QtQuick.Layouts

import Layouts

Item {
    id: root

    function updateModel(index, value) {
        console.log(index, value)
        // if (_.currentItem === 0) {
        //     item1.model[index].value = value;
        //     item1.Layout.minimumWidth = Qt.binding(function() { return item1.model[0].value; })
        //     item1.Layout.minimumHeight = Qt.binding(function() { return item1.model[1].value; })
        //     item1.Layout.preferredWidth = Qt.binding(function() { return item1.model[2].value; })
        //     item1.Layout.preferredHeight = Qt.binding(function() { return item1.model[3].value; })
        //     item1.Layout.maximumWidth = Qt.binding(function() { return item1.model[4].value; })
        //     item1.Layout.maximumHeight = Qt.binding(function() { return item1.model[5].value; })
        //     item1.Layout.fillWidth = Qt.binding(function() { return item1.model[6].value; })
        //     item1.Layout.fillHeight = Qt.binding(function() { return item1.model[7].value; })
        // } else if (_.currentItem === 1) {
        //     item2.model[index].value = value;
        //     item2.Layout.minimumWidth = Qt.binding(function() { return item2.model[0].value; })
        //     item2.Layout.minimumHeight = Qt.binding(function() { return item2.model[1].value; })
        //     item2.Layout.preferredWidth = Qt.binding(function() { return item2.model[2].value; })
        //     item2.Layout.preferredHeight = Qt.binding(function() { return item2.model[3].value; })
        //     item2.Layout.maximumWidth = Qt.binding(function() { return item2.model[4].value; })
        //     item2.Layout.maximumHeight = Qt.binding(function() { return item2.model[5].value; })
        //     item2.Layout.fillWidth = Qt.binding(function() { return item2.model[6].value; })
        //     item2.Layout.fillHeight = Qt.binding(function() { return item2.model[7].value; })
        // } else if (_.currentItem === 1) {
        //     item3.model[index].value = value;
        //     item3.Layout.minimumWidth = Qt.binding(function() { return item3.model[0].value; })
        //     item3.Layout.minimumHeight = Qt.binding(function() { return item3.model[1].value; })
        //     item3.Layout.preferredWidth = Qt.binding(function() { return item3.model[2].value; })
        //     item3.Layout.preferredHeight = Qt.binding(function() { return item3.model[3].value; })
        //     item3.Layout.maximumWidth = Qt.binding(function() { return item3.model[4].value; })
        //     item3.Layout.maximumHeight = Qt.binding(function() { return item3.model[5].value; })
        //     item3.Layout.fillWidth = Qt.binding(function() { return item3.model[6].value; })
        //     item3.Layout.fillHeight = Qt.binding(function() { return item3.model[7].value; })
        // }
    }

    AttributesModel {
        id: item1Model
    }
    AttributesModel {
        id: item2Model
    }
    AttributesModel {
        id: item3Model
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

                Component.onCompleted: {
                    item1Model.appendAttribute("Layout.minimumWidth", 0, 50);
                    item1Model.appendAttribute("Layout.minimumHeight", 0, -1);
                    item1Model.appendAttribute("Layout.preferredWidth", 0, 200);
                    item1Model.appendAttribute("Layout.preferredHeight", 0, 200);
                    item1Model.appendAttribute("Layout.maximumWidth", 0, -1);
                    item1Model.appendAttribute("Layout.maximumHeight", 0, -1);
                    item1Model.appendAttribute("Layout.fillWidth", 0, false);
                    item1Model.appendAttribute("Layout.fillHeight", 0, false);

                    Layout.minimumWidth = item1Model.getValue(0);
                    Layout.minimumHeight = item1Model.getValue(1);
                    Layout.preferredWidth = item1Model.getValue(2);
                    Layout.preferredHeight = item1Model.getValue(3);
                    Layout.maximumWidth = item1Model.getValue(4);
                    Layout.maximumHeight = item1Model.getValue(5);
                    Layout.fillWidth = item1Model.getValue(6);
                    Layout.fillHeight = item1Model.getValue(7);
                }

                // property var model: [
                //     {
                //         label: "Layout.minimumWidth",
                //         type: 0,
                //         value: 50
                //     },
                //     {
                //         label: "Layout.minimumHeight",
                //         type: 0,
                //         value: -1
                //     },
                //     {
                //         label: "Layout.preferredWidth",
                //         type: 0,
                //         value: 200
                //     },
                //     {
                //         label: "Layout.preferredHeight",
                //         type: 0,
                //         value: 200
                //     },
                //     {
                //         label: "Layout.maximumWidth",
                //         type: 0,
                //         value: -1
                //     },
                //     {
                //         label: "Layout.maximumHeight",
                //         type: 0,
                //         value: -1
                //     },
                //     {
                //         label: "Layout.fillWidth",
                //         type: 1,
                //         value: false
                //     },
                //     {
                //         label: "Layout.fillHeight",
                //         type: 1,
                //         value: false
                //     }
                // ]

                color: "green"
                // Layout.minimumWidth: item1Model.getValue(0)
                // Layout.minimumHeight: item1Model.getValue(1)
                // Layout.preferredWidth: item1Model.getValue(2)
                // Layout.preferredHeight: item1Model.getValue(3)
                // Layout.maximumWidth: item1Model.getValue(4)
                // Layout.maximumHeight: item1Model.getValue(5)
                // Layout.fillWidth: item1Model.getValue(6)
                // Layout.fillHeight: item1Model.getValue(7)

                MouseArea {
                    anchors.fill: parent
                    onClicked: _.currentItem = 0;
                }
            }
            Rectangle {
                id: item2

                Component.onCompleted: {
                    item2Model.appendAttribute("Layout.minimumWidth", 0, -1);
                    item2Model.appendAttribute("Layout.minimumHeight", 0, -1);
                    item2Model.appendAttribute("Layout.preferredWidth", 0, 100);
                    item2Model.appendAttribute("Layout.preferredHeight", 0, -1);
                    item2Model.appendAttribute("Layout.maximumWidth", 0, -1);
                    item2Model.appendAttribute("Layout.maximumHeight", 0, -1);
                    item2Model.appendAttribute("Layout.fillWidth", 0, false);
                    item2Model.appendAttribute("Layout.fillHeight", 0, true);

                    Layout.minimumWidth = item2Model.getValue(0);
                    Layout.minimumHeight = item2Model.getValue(1);
                    Layout.preferredWidth = item2Model.getValue(2);
                    Layout.preferredHeight = item2Model.getValue(3);
                    Layout.maximumWidth = item2Model.getValue(4);
                    Layout.maximumHeight = item2Model.getValue(5);
                    Layout.fillWidth = item2Model.getValue(6);
                    Layout.fillHeight = item2Model.getValue(7);
                }

            //     property var model: [
            //         {
            //             label: "Layout.minimumWidth",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.minimumHeight",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.preferredWidth",
            //             type: 0,
            //             value: 100
            //         },
            //         {
            //             label: "Layout.preferredHeight",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.maximumWidth",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.maximumHeight",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.fillWidth",
            //             type: 1,
            //             value: false
            //         },
            //         {
            //             label: "Layout.fillHeight",
            //             type: 1,
            //             value: true
            //         }
            //     ]

                color: "yellow"
            //     Layout.minimumWidth: model[0].value
            //     Layout.minimumHeight: model[1].value
            //     Layout.preferredWidth: model[2].value
            //     Layout.preferredHeight: model[3].value
            //     Layout.maximumWidth: model[4].value
            //     Layout.maximumHeight: model[5].value
            //     Layout.fillWidth: model[6].value
            //     Layout.fillHeight: model[7].value

                MouseArea {
                    anchors.fill: parent
                    onClicked: _.currentItem = 1;
                }
            }

            Rectangle {
                id: item3

                Component.onCompleted: {
                    item3Model.appendAttribute("Layout.minimumWidth", 0, -1);
                    item3Model.appendAttribute("Layout.minimumHeight", 0, -1);
                    item3Model.appendAttribute("Layout.preferredWidth", 0, -1);
                    item3Model.appendAttribute("Layout.preferredHeight", 0, -1);
                    item3Model.appendAttribute("Layout.maximumWidth", 0, -1);
                    item3Model.appendAttribute("Layout.maximumHeight", 0, -1);
                    item3Model.appendAttribute("Layout.fillWidth", 0, true);
                    item3Model.appendAttribute("Layout.fillHeight", 0, true);

                    Layout.minimumWidth = item3Model.getValue(0);
                    Layout.minimumHeight = item3Model.getValue(1);
                    Layout.preferredWidth = item3Model.getValue(2);
                    Layout.preferredHeight = item3Model.getValue(3);
                    Layout.maximumWidth = item3Model.getValue(4);
                    Layout.maximumHeight = item3Model.getValue(5);
                    Layout.fillWidth = item3Model.getValue(6);
                    Layout.fillHeight = item3Model.getValue(7);
                }

            //     property var model: [
            //         {
            //             label: "Layout.minimumWidth",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.minimumHeight",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.preferredWidth",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.preferredHeight",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.maximumWidth",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.maximumHeight",
            //             type: 0,
            //             value: -1
            //         },
            //         {
            //             label: "Layout.fillWidth",
            //             type: 1,
            //             value: true
            //         },
            //         {
            //             label: "Layout.fillHeight",
            //             type: 1,
            //             value: true
            //         }
            //     ]

                color: "red"
            //     Layout.minimumWidth: model[0].value
            //     Layout.minimumHeight: model[1].value
            //     Layout.preferredWidth: model[2].value
            //     Layout.preferredHeight: model[3].value
            //     Layout.maximumWidth: model[4].value
            //     Layout.maximumHeight: model[5].value
            //     Layout.fillWidth: model[6].value
            //     Layout.fillHeight: model[7].value

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
                anchors {
                    fill: parent
                    margins: 4
                }
                clip: true
                model: {
                    if (_.currentItem === 0)
                        return item1Model;
                    if (_.currentItem === 1)
                        return item2Model;
                    return item3Model;
                }
                delegate: Item {
                    id: del
                    //required property var modelData
                    property string myLabel: propertiesModel.model.label
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
                                    text: del.myLabel//del.modelData.label
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            Item {
                                width: parent.width; height: (parent.height-parent.spacing)/2

                                Row {
                                    visible: del.ListView.view.model.type === 0//del.modelData.type === 0
                                    anchors.fill: parent

                                    TextInput {
                                        height: parent.height
                                        width: parent.width/2
                                        font {
                                            pixelSize: 24
                                            bold: true
                                        }
                                        text: del.ListView.view.model.value//del.modelData.value
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        onAccepted: {
                                            //del.modelData.value = text;
                                            del.ListView.view.model.value = text;
                                            root.updateModel(del.index, text)
                                        }
                                    }

                                    Item {
                                        height: parent.height
                                        width: parent.width/2

                                        Rectangle {
                                            border {
                                                width: 1
                                                color: "black"
                                            }
                                            color: "lightgray"
                                            width: parent.width*3/4
                                            height: width/2
                                            radius: 5

                                            Text {
                                                anchors.fill: parent
                                                text: "default"
                                                font {
                                                    pixelSize: 8
                                                }
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                            }

                                            MouseArea {
                                                anchors.fill: parent
                                                onClicked: {
                                                    //del.modelData.value = -1;
                                                    del.ListView.view.model.value = -1;
                                                    root.updateModel(del.index, -1)
                                                }
                                            }
                                        }
                                    }
                                }

                                Rectangle {
                                    visible: del.ListView.view.model.type === 1//del.modelData.type === 1
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    color: del.ListView.view.model.value ? "lightgray" : "white"//del.modelData.value ? "lightgray" : "white"

                                    Text {
                                        anchors.fill: parent
                                        text: del.ListView.view.model.value//del.modelData.value
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
                                            //del.modelData.value = !del.modelData.value;
                                            del.ListView.view.model.value = !del.ListView.view.model.value;
                                            root.updateModel(del.index, /*del.modelData.value*/del.ListView.view.model.value)
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
