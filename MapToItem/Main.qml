import QtQuick

Window {
    id: root
    width: 1600
    height: width * 960 / 1280
    visible: true
    title: qsTr("MapToItem")

    function mapFromItem(itemUT, targetedItem) {
        // point mapFromItem(Item item, real x, real y)
        // rect mapFromItem(Item item, real x, real y, real width, real height)
        // Maps the PROVIDED point (x, y) or rect (x, y, width, height),
        // which is in the PROVIDED item's coordinate system, to THIS (caller) item's coordinate system,
        // and returns a point or rect matching the mapped coordinate.
        let x = `${itemUT.objectName}'s x in ${targetedItem.objectName}'s coordinate system: ${targetedItem.mapFromItem(itemUT, 0, 0, itemUT.width, itemUT.height).x}`;
        let y = `${itemUT.objectName}'s y in ${targetedItem.objectName}'s coordinate system: ${targetedItem.mapFromItem(itemUT, 0, 0, itemUT.width, itemUT.height).y}`;
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
        let y = `${itemUT.objectName}'s y in ${targetedItem.objectName}'s coordinate system: ${itemUT.mapToItem(targetedItem, 0, 0, itemUT.width, itemUT.height).y}`;
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
                text: `x: ${mainContainer.x}\ny: ${mainContainer.y}\nw: ${blueRect.width}\nh: ${blueRect.height}`
                color: mainContainer.border.color
            }

            Rectangle {
                id: redRect
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
                    text: `x: ${redRect.x}\ny: ${redRect.y}\nw: ${blueRect.width}\nh: ${blueRect.height}`
                    color: redRect.border.color
                }

                Rectangle {
                    id: orangeRect
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
                                    onClicked: root.mapFromItem(orangeRect, blueRect)
                                }
                            }
                            Text {
                                height: parent.height; width: (parent.width-parent.spacing)/2
                                text: "mapToItem"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignTop

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: root.mapToItem(orangeRect, blueRect)
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
                        text: `x: ${orangeRect.x}\ny: ${orangeRect.y}\nw: ${blueRect.width}\nh: ${blueRect.height}`
                        color: orangeRect.border.color
                    }
                }

                Rectangle {
                    id: blueRect
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
                                    onClicked: root.mapFromItem(blueRect, orangeRect)
                                }
                            }
                            Text {
                                height: parent.height; width: (parent.width-parent.spacing)/2
                                text: "mapToItem"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignTop

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: root.mapToItem(blueRect, orangeRect)
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
                        text: `x: ${blueRect.x}\ny: ${blueRect.y}\nw: ${blueRect.width}\nh: ${blueRect.height}`
                        color: blueRect.border.color
                    }
                }
            }

            Rectangle {
                id: greenRect
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
                                onClicked: root.mapFromItem(blueRect, orangeRect)
                            }
                        }
                        Text {
                            height: parent.height; width: (parent.width-parent.spacing)/2
                            text: "mapToItem"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignTop

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.mapToItem(blueRect, orangeRect)
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
                    text: `x: ${greenRect.x}\ny: ${greenRect.y}\nw: ${greenRect.width}\nh: ${greenRect.height}`
                    color: greenRect.border.color
                }
            }
        }
        Item {
            width: parent.width
            height: 400

            Row {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10

                Rectangle {
                    id: terminal
                    height: parent.height
                    width: (parent.width-parent.spacing)/2
                    color: "lightgray"

                    Text {
                        id: terminalText
                        anchors.fill: parent
                        anchors.margins: 10
                        font.pixelSize: 16
                        wrapMode: Text.WordWrap
                    }
                }

                Rectangle {
                    height: parent.height
                    width: (parent.width-parent.spacing)/2
                    color: "lightgray"

                    Column {
                        anchors.fill: parent
                        anchors.margins: 5

                        Row {
                            width: parent.width; height: parent.height/2

                            Column {
                                height: parent.height
                                width: parent.width*3/4
                                spacing: 5

                                Text {
                                    text: "orange.mapFromItem(blue, blue.x, blue.y, blue.w, blue.h)"
                                    font.pixelSize: 16
                                    font.bold: true
                                }
                                InputField {
                                    id: mfixif
                                    width: parent.width
                                    title :"blue.x"
                                    value: 0
                                }
                                InputField {
                                    id: mfiyif
                                    width: parent.width
                                    title :"blue.y"
                                    value: 0
                                }
                                InputField {
                                    id: mfiwif
                                    width: parent.width
                                    title :"blue.w"
                                    value: blueRect.width
                                }
                                InputField {
                                    id: mfihif
                                    width: parent.width
                                    title :"blue.h"
                                    value: blueRect.height
                                }
                            }
                            Item {
                                height: parent.height
                                width: parent.width/4

                                Rectangle {
                                    width: parent.width/3
                                    height: width/2
                                    radius: 5
                                    color: "white"
                                    border.width: 1
                                    anchors.centerIn: parent

                                    Text {
                                        anchors.fill: parent
                                        text: "OK"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter

                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: {
                                                mfixif.result = orangeRect.mapFromItem(blueRect, parseFloat(mfixif.value), parseFloat(mfiyif.value), parseFloat(mfiwif.value), parseFloat(mfihif.value)).x
                                                mfiyif.result = orangeRect.mapFromItem(blueRect, parseFloat(mfixif.value), parseFloat(mfiyif.value), parseFloat(mfiwif.value), parseFloat(mfihif.value)).y
                                                mfiwif.result = orangeRect.mapFromItem(blueRect, parseFloat(mfixif.value), parseFloat(mfiyif.value), parseFloat(mfiwif.value), parseFloat(mfihif.value)).width
                                                mfihif.result = orangeRect.mapFromItem(blueRect, parseFloat(mfixif.value), parseFloat(mfiyif.value), parseFloat(mfiwif.value), parseFloat(mfihif.value)).height
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Row {
                            width: parent.width; height: parent.height/2

                            Column {
                                height: parent.height
                                width: parent.width*3/4
                                spacing: 5

                                Text {
                                    text: "blue.mapToItem(orange, blue.x, blue.y, blue.w, blue.h)"
                                    font.pixelSize: 16
                                    font.bold: true
                                }
                                InputField {
                                    id: mtixif
                                    width: parent.width
                                    title :"blue.x"
                                    value: 0
                                }
                                InputField {
                                    id: mtiyif
                                    width: parent.width
                                    title :"blue.y"
                                    value: 0
                                }
                                InputField {
                                    id: mtiwif
                                    width: parent.width
                                    title :"blue.w"
                                    value: blueRect.width
                                }
                                InputField {
                                    id: mtihif
                                    width: parent.width
                                    title :"blue.h"
                                    value: blueRect.height
                                }
                            }
                            Item {
                                height: parent.height
                                width: parent.width/4

                                Rectangle {
                                    width: parent.width/3
                                    height: width/2
                                    anchors.centerIn: parent
                                    radius: 5
                                    color: "white"
                                    border.width: 1

                                    Text {
                                        anchors.fill: parent
                                        text: "OK"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            mtixif.result = blueRect.mapToItem(orangeRect, parseFloat(mtixif.value), parseFloat(mtiyif.value), parseFloat(mtiwif.value), parseFloat(mtihif.value)).x
                                            mtiyif.result = blueRect.mapToItem(orangeRect, parseFloat(mtixif.value), parseFloat(mtiyif.value), parseFloat(mtiwif.value), parseFloat(mtihif.value)).y
                                            mtiwif.result = blueRect.mapToItem(orangeRect, parseFloat(mtixif.value), parseFloat(mtiyif.value), parseFloat(mtiwif.value), parseFloat(mtihif.value)).width
                                            mtihif.result = blueRect.mapToItem(orangeRect, parseFloat(mtixif.value), parseFloat(mtiyif.value), parseFloat(mtiwif.value), parseFloat(mtihif.value)).height
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

    component InputField: Row {
        property string title
        property double value
        property alias result: resultTxt.text

        spacing: 5
        height: titleTxt.implicitHeight

        Text {
            id: titleTxt
            text: title
            width: 50
        }

        Rectangle {
            border.width: 1; color: "white"
            height: titleTxt.height
            width: 100

            TextInput {
                id: txtInput
                text: value
                anchors {
                    left: parent.left
                    leftMargin: 2
                    right: parent.right
                    rightMargin: 2
                }
            }
        }

        Rectangle {
            border.width: 1; color: "lightblue"
            height: titleTxt.height
            width: 100

            Text {
                id: resultTxt
                anchors {
                    left: parent.left
                    leftMargin: 2
                    right: parent.right
                    rightMargin: 2
                }
            }
        }
    }
}
