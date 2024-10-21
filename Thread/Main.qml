import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import playground

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property bool working: false
    property bool working2: myThread.working

    SampleThread {
        id: myThread
        onWorkDone: working = false
    }

    RowLayout {
        anchors {
            fill: parent
            margins: 10
        }

        ColumnLayout {
            id: leftSide
            Layout.preferredWidth: parent.width/2
            Layout.fillHeight: true

            Button {
                Layout.alignment: Qt.AlignRight
                text: "Run"
                onClicked: {
                    working = true // the color is not updated to red because "doWork" holds the CPU
                    myThread.doWork()
                }
            }
            Button {
                Layout.alignment: Qt.AlignRight
                text: "Message 1"
                onClicked: myText.text = "message 1"
            }
            Button {
                Layout.alignment: Qt.AlignRight
                text: "Message 2"
                onClicked: myText.text = "message 2"
            }
            Button {
                Layout.alignment: Qt.AlignRight
                text: "Clear"
                onClicked: myText.text = ""
            }
        }
        Item {
            id: rightSide
            Layout.preferredWidth: parent.width/2
            Layout.fillHeight: true

            ColumnLayout {
                anchors {
                    fill: parent
                    margins: 10
                }
                spacing: 20

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Text {
                        id: myText
                        width: parent.width
                        height: 50
                        font.pixelSize: height/2
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.bottom: parent.bottom

                        Rectangle {
                            color: "transparent"
                            anchors.fill: parent
                            border {
                               width: 2
                            }
                        }
                    }
                }
                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    RowLayout {
                        width: parent.width
                        height: 50
                        anchors.top: parent.top

                        Rectangle {
                            color: working ? "red" : "green"
                            Layout.fillHeight: true
                            Layout.preferredWidth: 2*height
                            Layout.alignment: Qt.AlignHCenter

                            Text {
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "signal/slot"
                            }
                        }
                        Rectangle {
                            color: working2 ? "red" : "green"
                            Layout.fillHeight: true
                            Layout.preferredWidth: 2*height
                            Layout.alignment: Qt.AlignHCenter

                            Text {
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "binding"
                            }
                        }
                    }
                }
            }
        }
    }
}
