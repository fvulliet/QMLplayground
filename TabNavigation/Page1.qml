import QtQuick
import QtQuick.Controls

Column {
    Button {
        width: parent.width
        height: (parent.height-2*parent.spacing)/3
        text: "Button 1"
    }

    Button {
        width: parent.width
        height: (parent.height-2*parent.spacing)/3
        text: "Button 2"
    }

    MyButton {
        width: parent.width
        height: (parent.height-2*parent.spacing)/3
        text: "Button 3"
    }

    component MyButton: Button {
        contentItem: Rectangle {
            color: "red"
        }
    }
}
