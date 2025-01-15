import QtQuick

Window {
    id: root
    width: 1280
    height: 960
    visible: true
    title: qsTr("MapToItem")

    function mapFromItem(itemUT, targetedItem) {
        // point mapFromItem(Item item, real x, real y)
        // rect mapFromItem(Item item, real x, real y, real width, real height)
        // Maps the PROVIDED point (x, y) or rect (x, y, width, height),
        // which is in the PROVIDED item's coordinate system, to THIS (caller) item's coordinate system,
        // and returns a point or rect matching the mapped coordinate.
        let x = `${itemUT.objectName}'s x in ${targetedItem.objectName}'s coordinate system: ${targetedItem.mapFromItem(itemUT, 0, 0, itemUT.width, itemUT.height).x}`;
        let y = `${itemUT.objectName}'s y in ${targetedItem.objectName}'s coordinate system: ${targetedItem.mapFromItem(itemUT, 0, 0, itemUT.width, itemUT.height).x}`;
        let width = `${itemUT.objectName}'s width in ${targetedItem.objectName}'s coordinate system: ${targetedItem.mapFromItem(itemUT, 0, 0, itemUT.width, itemUT.height).width}`;
        let height = `${itemUT.objectName}'s height in ${targetedItem.objectName}'s coordinate system: ${targetedItem.mapFromItem(itemUT, 0, 0, itemUT.width, itemUT.height).height}`;

        terminalText.text = `mapFromItem; what is the top-left coordinate of ${itemUT.objectName} in the ${targetedItem.objectName} referential ?`
        terminalText.text += `\n\n${targetedItem.objectName}.mapFromItem(${itemUT.objectName}, 0, 0, ${itemUT.objectName}.width, ${itemUT.objectName}.height)`
        terminalText.text += `\n\n${x}\n${y}\n${width}\n${height}`
    }

    function mapToItem(itemUT, targetedItem) {
        // point mapToItem(Item item, real x, real y)
        // rect mapToItem(Item item, real x, real y, real width, real height)
        // Maps the PROVIDED point (x, y) or rect (x, y, width, height),
        // which is in THIS (caller) item's coordinate system, to the PROVIDED item's coordinate system,
        // and returns a point or rect matching the mapped coordinate.
        let x = `${itemUT.objectName}'s x in ${targetedItem.objectName}'s coordinate system: ${itemUT.mapToItem(targetedItem, 0, 0, itemUT.width, itemUT.height).x}`;
        let y = `${itemUT.objectName}'s y in ${targetedItem.objectName}'s coordinate system: ${itemUT.mapToItem(targetedItem, 0, 0, itemUT.width, itemUT.height).x}`;
        let width = `${itemUT.objectName}'s width in ${targetedItem.objectName}'s coordinate system: ${itemUT.mapToItem(targetedItem, 0, 0, targetedItem.width, targetedItem.height).width}`;
        let height = `${itemUT.objectName}'s height in ${targetedItem.objectName}'s coordinate system: ${itemUT.mapToItem(targetedItem, 0, 0, targetedItem.width, targetedItem.height).height}`;

        terminalText.text = `mapToItem; what is the top-left coordinate of ${itemUT.objectName} in the ${targetedItem.objectName} referential ?`
        terminalText.text += `\n\n${itemUT.objectName}.mapToItem(${targetedItem.objectName}, 0, 0, ${itemUT.objectName}.width, ${itemUT.objectName}.height)`
        terminalText.text += `\n\n${x}\n${y}\n${width}\n${height}`
    }

    Column {
        anchors.fill: parent
        spacing: 10

        Rectangle {
            id: mainContainer
            objectName: "black"
            border.width: 10
            border.color: "black"
            width: parent.width
            height: parent.height - terminal.height - parent.spacing

            Text {
                anchors {
                    left: parent.left
                    leftMargin: 10
                    bottom: parent.bottom
                    bottomMargin: 10
                }
                text: `x: ${mainContainer.x}\ny: ${mainContainer.y}\nw: ${rect12.width}\nh: ${rect12.height}`
                color: mainContainer.border.color
            }

            Rectangle {
                id: rect1
                objectName: "red"
                border.color: "red"
                border.width: 10
                anchors {
                    left: parent.left
                    top: parent.top
                }
                height: parent.height/2
                width: parent.width/2

                Text {
                    anchors {
                        left: parent.left
                        leftMargin: 10
                        bottom: parent.bottom
                        bottomMargin: 10
                    }
                    text: `x: ${rect1.x}\ny: ${rect1.y}\nw: ${rect12.width}\nh: ${rect12.height}`
                    color: rect1.border.color
                }

                Rectangle {
                    id: rect11
                    objectName: "orange"
                    border.color: "orange"
                    border.width: 10
                    anchors {
                        left: parent.left
                        top: parent.top
                    }
                    height: parent.height/2
                    width: parent.width/2

                    Column {
                        anchors.fill: parent
                        spacing: 10

                        Item {
                            width: parent.width; height: (parent.height-parent.spacing)/2

                            Text {
                                anchors.fill: parent
                                text: "orange"
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignBottom
                            }
                        }
                        Row {
                            width: parent.width; height: (parent.height-parent.spacing)/2

                            Text {
                                height: parent.height; width: (parent.width-parent.spacing)/2
                                text: "mapFromItem"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignTop

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: root.mapFromItem(rect11, rect12)
                                }
                            }
                            Text {
                                height: parent.height; width: (parent.width-parent.spacing)/2
                                text: "mapToItem"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignTop

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: root.mapToItem(rect11, rect12)
                                }
                            }
                        }
                    }

                    Text {
                        anchors {
                            right: parent.right
                            rightMargin: 10
                            top: parent.top
                            topMargin: 10
                        }
                        text: `x: ${rect11.x}\ny: ${rect11.y}\nw: ${rect12.width}\nh: ${rect12.height}`
                        color: rect11.border.color
                    }
                }

                Rectangle {
                    id: rect12
                    objectName: "blue"
                    border.color: "blue"
                    border.width: 10
                    anchors {
                        right: parent.right
                        bottom: parent.bottom
                    }
                    height: parent.height/2
                    width: parent.width/2

                    Column {
                        anchors.fill: parent
                        spacing: 10

                        Item {
                            width: parent.width; height: (parent.height-parent.spacing)/2

                            Text {
                                anchors.fill: parent
                                text: "blue"
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignBottom
                            }
                        }
                        Row {
                            width: parent.width; height: (parent.height-parent.spacing)/2

                            Text {
                                height: parent.height; width: (parent.width-parent.spacing)/2
                                text: "mapFromItem"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignTop

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: root.mapFromItem(rect12, rect11)
                                }
                            }
                            Text {
                                height: parent.height; width: (parent.width-parent.spacing)/2
                                text: "mapToItem"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignTop

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: root.mapToItem(rect12, rect11)
                                }
                            }
                        }
                    }

                    Text {
                        anchors {
                            right: parent.right
                            rightMargin: 10
                            top: parent.top
                            topMargin: 10
                        }
                        text: `x: ${rect12.x}\ny: ${rect12.y}\nw: ${rect12.width}\nh: ${rect12.height}`
                        color: rect12.border.color
                    }
                }
            }

            Rectangle {
                id: rect2
                objectName: "green"
                border.color: "green"
                border.width: 10
                anchors {
                    right: parent.right
                    bottom: parent.bottom
                }
                height: parent.height/2
                width: parent.width/2

                Column {
                    anchors.fill: parent
                    spacing: 10

                    Item {
                        width: parent.width; height: (parent.height-parent.spacing)/2

                        Text {
                            anchors.fill: parent
                            text: "green"
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignBottom
                        }
                    }
                    Row {
                        width: parent.width; height: (parent.height-parent.spacing)/2

                        Text {
                            height: parent.height; width: (parent.width-parent.spacing)/2
                            text: "mapFromItem"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignTop

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.mapFromItem(rect2, rect12)
                            }
                        }
                        Text {
                            height: parent.height; width: (parent.width-parent.spacing)/2
                            text: "mapToItem"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignTop

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.mapToItem(rect12, rect11)
                            }
                        }
                    }
                }

                Text {
                    anchors {
                        left: parent.left
                        leftMargin: 10
                        bottom: parent.bottom
                        bottomMargin: 10
                    }
                    text: `x: ${rect2.x}\ny: ${rect2.y}\nw: ${rect2.width}\nh: ${rect2.height}`
                    color: rect2.border.color
                }
            }
        }
        Item {
            id: terminal
            width: parent.width
            height: 200

            Text {
                id: terminalText
                anchors.fill: parent
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }
        }
    }


}
