import QtQuick
import QtQuick.Layouts

FocusScope {
    // when a component gets the active focus, it forwards this active focus to one if its children;
    // it acts pretty much like a proxy
    id: root

    property int margin: 10
    property int counter: 0
    property alias color: innerRect.color
    property string note: "change me !"

    signal newValue(int c)
    signal newInnerActiveFocus(string value)

    Rectangle {
        id: innerRect
        objectName: "innerRect"
        anchors {
            fill: parent
            margins: margin
        }

        RowLayout {
            anchors.fill: parent
            spacing: 0

            FocusScope {
                id: leftElement
                objectName: "LEFT"
                Layout.fillHeight: true
                Layout.preferredWidth: innerRect.width / 3
                onActiveFocusChanged: {
                    if (activeFocus) {
                        newInnerActiveFocus(leftElement.objectName)
                    }
                }

                Rectangle {
                    color: "transparent"
                    border {
                        width: leftElement.activeFocus ? 3 : 0
                    }
                    anchors {
                        fill: parent
                        margins: 5
                    }

                    TextInput {
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: height / 4
                        cursorVisible: leftElement.activeFocus
                        text: root.note
                        selectByMouse: true
                        focus: true
                    }
                }
            }
            Item {
                id: centerElement
                objectName: "CENTER"
                Layout.fillHeight: true
                Layout.preferredWidth: innerRect.width / 3
                focus: true // this gets the focus by default
                onActiveFocusChanged: {
                    if (activeFocus) {
                        newInnerActiveFocus(centerElement.objectName)
                    }
                }

                Rectangle {
                    color: "transparent"
                    border {
                        width: centerElement.activeFocus ? 3 : 0
                    }
                    anchors {
                        fill: parent
                        margins: 5
                    }

                    Text {
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: height / 4
                        text: "center item"
                    }
                }
            }
            Item {
                id: rightElement
                objectName: "RIGHT"
                Layout.fillHeight: true
                Layout.preferredWidth: innerRect.width / 3
                onActiveFocusChanged: {
                    if (activeFocus) {
                        newInnerActiveFocus(rightElement.objectName)
                    }
                }

                Rectangle {
                    color: "transparent"
                    border {
                        width: rightElement.activeFocus ? 3 : 0
                    }
                    anchors {
                        fill: parent
                        margins: 5
                    }

                    Column {
                        anchors.fill: parent

                        Text {
                            width: parent.width; height: parent.height / 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: height / 2
                            text: "count"
                        }
                        Text {
                            width: parent.width; height: parent.height / 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font {
                                bold: true
                                pixelSize: height / 2
                            }
                            text: counter
                        }
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.OpenHandCursor
            onClicked: {
                root.newValue(++counter);
            }
        }

        // keys are caught only if the item has the active focus
        Keys.onPressed: (event)=> {
                            if (event.key === Qt.Key_P || event.key === Qt.Key_Plus) {
                                root.newValue(++counter);
                            }
                            else if (event.key === Qt.Key_M || event.key === Qt.Key_Minus) {
                                root.newValue(--counter);
                            }
                            else if (event.key === Qt.Key_Left) {
                                if (leftElement.activeFocus) {
                                    rightElement.forceActiveFocus();
                                }
                                else if (centerElement.activeFocus) {
                                    leftElement.forceActiveFocus();
                                }
                                else if (rightElement.activeFocus) {
                                    centerElement.forceActiveFocus();
                                }
                            }
                            else if (event.key === Qt.Key_Right) {
                                if (leftElement.activeFocus) {
                                    centerElement.forceActiveFocus();
                                }
                                else if (centerElement.activeFocus) {
                                    rightElement.forceActiveFocus();
                                }
                                else if (rightElement.activeFocus) {
                                    leftElement.forceActiveFocus();
                                }
                            }
                        }
    }
}
