import QtQuick
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property int counterValue1: 0
    property alias counterValue2: cnt2.count // through this alias, cnt2's count is exposed

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height/2
            border.width: 2

            RowLayout {
                anchors {
                    fill: parent
                    margins: 10
                }

                MyCounter {
                    id: ctn1
                    Layout.fillHeight: true
                    Layout.preferredWidth: height
                    // count is bound with counterValue1:
                    // it means when MyButton is clicked, it emits a signal
                    // which is caught here, and the value is incremented
                    // within the slot (onClicked)
                    count: counterValue1
                    onClicked: counterValue1++
                }
                ColumnLayout {
                    id: col1
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Text {
                        id: text1
                        Layout.fillWidth: true
                        Layout.preferredHeight: col1.height*2/3
                        font.pixelSize: height/4
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: counterValue1
                    }
                    Text {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        font.pixelSize: height/4
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: "incremented through signal/slot"
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height/2
            border.width: 2

            RowLayout {
                anchors {
                    fill: parent
                    margins: 10
                }

                MyCounter {
                    id: cnt2
                    Layout.fillHeight: true
                    Layout.preferredWidth: height
                    // count is not bound with any property of main.qml
                    count: 0
                    onClicked: count++
                }
                ColumnLayout {
                    id: col2
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Text {
                        id: text2
                        Layout.fillWidth: true
                        Layout.preferredHeight: col2.height*2/3
                        font.pixelSize: height/4
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: counterValue2
                    }
                    Text {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        font.pixelSize: height/4
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: "incremented with passing value"
                    }
                }
            }
        }
    }
}
