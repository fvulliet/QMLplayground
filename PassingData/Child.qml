import QtQuick

Item {
    id: root

    required property var myData
    property bool isAdd: false

    signal updateMyData(var d)

    Text {
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: root.isAdd ? "append" : "remove"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (root.isAdd) {
                root.myData.push(root.myData.length);
            } else {
                if (root.myData.length > 0)
                    root.myData.pop();
            }
            root.updateMyData(root.myData)
        }
    }
}
