import QtQuick
import QtQuick.Layouts
import CppIntegration 1.0

Window {
    width: 800
    height: 800
    visible: true
    title: qsTr("CppIntegration")

    Person { id: jack; name: "jack"; age: Person.Medium; }
    Person { id: jim; name: "jim"; age: Person.Young; }
    Person { id: john; name: "john"; age: 51; }

    component PersonComp: Rectangle {
        property string name
        property int age

        border.width: 1

        RowLayout {
            anchors.fill: parent

            Text {
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width / 2
                text: name
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            Text {
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width / 2
                text: age
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    ColumnLayout {
        width: parent.width/2
        spacing: 10
        anchors.centerIn: parent

        PersonComp {
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            name: jack.name
            age: jack.age
        }
        PersonComp {
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            name: jim.name
            age: jim.age
        }
        PersonComp {
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            name: john.name
            age: john.age
        }
    }
}
