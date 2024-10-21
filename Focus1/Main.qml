import QtQuick
import QtQuick.Layouts

Window {
    width: 800
    height: 800
    visible: true
    title: qsTr("Focus 1")

    property string elementWithActiveFocus

    Rectangle {
        anchors.fill: parent
        color: "#404040"

        ColumnLayout {
            id: mainColumn

            property int currentCount

            anchors.fill: parent
            spacing: 0

            Header {
                id: header
                Layout.preferredHeight: 150
                Layout.fillWidth: true
                txtActiveFocus: elementWithActiveFocus
            }

            Item {
                // this item is not a FocusScope !
                Layout.preferredHeight: 100
                Layout.fillWidth: true
                onActiveFocusChanged: {
                    if (activeFocus) {
                        elementWithActiveFocus = "TOP TEXTINPUT"
                        header.activeFocusColor = "white";
                    }
                }

                Rectangle {
                    anchors {
                        fill: parent
                        margins: 10
                    }
                    border.width: 1
                    color: "white"

                    TextInput {
                        anchors.fill: parent
                        anchors.centerIn: parent
                        font.pixelSize: height / 2
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: "i am not a FocusScope !"
                    }
                }
            }

            MyRectangle {
                id: redRect
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "red"
                margin: 10
                focus: true
                onActiveFocusChanged: {
                    if (activeFocus) {
                        header.activeFocusColor = redRect.color;
                    }
                }
                onNewValue: function(c) {
                    header.clickedColor = redRect.color;
                    mainColumn.currentCount = c;
                    redRect.focus = true;
                }
                onNewInnerActiveFocus: function(value) { elementWithActiveFocus = value; }
            }

            MyRectangle {
                id: yellowRect
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "yellow"
                margin: 10
                note: "never claims focus"
                onActiveFocusChanged: {
                    if (activeFocus) {
                        header.activeFocusColor = yellowRect.color;
                    }
                }
                onNewValue: function(c){
                    header.clickedColor = yellowRect.color;
                    mainColumn.currentCount = c;
                }
                onNewInnerActiveFocus: function(value) { elementWithActiveFocus = value; }
            }

            MyRectangle {
                id: greenRect
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "green"
                margin: 10
                onActiveFocusChanged: {
                    if (activeFocus) {
                        header.activeFocusColor = greenRect.color;
                    }
                }
                onNewValue: function(c){
                    header.clickedColor = greenRect.color;
                    mainColumn.currentCount = c;
                    greenRect.focus = true;
                }
                onNewInnerActiveFocus: function(value) { elementWithActiveFocus = value; }
            }

            FocusScope {
                // this item is a FocusScope !
                Layout.preferredHeight: 100
                Layout.fillWidth: true
                onActiveFocusChanged: {
                    if (activeFocus) {
                        elementWithActiveFocus = "BOTTOM TEXTINPUT"
                        header.activeFocusColor = "white";
                    }
                }

                Rectangle {
                    anchors {
                        fill: parent
                        margins: 10
                    }
                    border.width: 1
                    color: "white"

                    TextInput {
                        anchors.fill: parent
                        anchors.centerIn: parent
                        font.pixelSize: height / 2
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: "i am a FocusScope"
                    }
                }
            }
        }

        Keys.onPressed: (event)=> {
                            if (event.key === Qt.Key_Up) {
                                if (redRect.activeFocus) {
                                    greenRect.forceActiveFocus();
                                }
                                else if (greenRect.activeFocus) {
                                    redRect.forceActiveFocus();
                                }
                            }
                            else if (event.key === Qt.Key_Down) {
                                if (redRect.activeFocus) {
                                    greenRect.forceActiveFocus();
                                }
                                else if (greenRect.activeFocus) {
                                    redRect.forceActiveFocus();
                                }
                            }
                            else if (event.key === Qt.Key_Tab) {
                                // ??
                            }
                        }
    }
}
