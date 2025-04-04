import QtQuick
import QtQuick.Controls

Row {
    FocusScope {
        height: parent.height
        width: parent.width/2

        Column {
            Button { text: "Left Button 1" }
            Button { text: "Left Button 2" }
        }
    }

    FocusScope {
        height: parent.height
        width: parent.width/2

        Column {
            Button { text: "Right Button 1" }
            Button { text: "Right Button 2" }
        }
    }
}


