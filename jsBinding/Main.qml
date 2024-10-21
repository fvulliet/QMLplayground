import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("jsBinding")

    property int count: 0
    property bool toggle: false
    onToggleChanged: {
        count = Qt.binding(function() {
            return myComp.bodyList.length;
        });
    }
    // onToggleChanged: {
    //     count = myComp.bodyList.length;
    // }

    Column {
        anchors.fill: parent

        Rectangle {
            color: "green"
            width: parent.width; height: parent.height/6

            Text {
                anchors.centerIn: parent
                text: "4 elements"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    toggle = !toggle;
                    myComp.bodyList = ["desc1", "desc2", "desc3", "desc4"];
                }
            }
        }
        Rectangle {
            color: "red"
            width: parent.width; height: parent.height/6

            Text {
                anchors.centerIn: parent
                text: "2 elements"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    toggle = !toggle;
                    myComp.bodyList = ["desc1", "desc2"];
                }
            }
        }
        MyComponent {
            id: myComp
            width: parent.width; height: parent.height*2/3

            title: "foo_" + count
        }
    }
}
