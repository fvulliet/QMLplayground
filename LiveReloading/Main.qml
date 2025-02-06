import QtQuick

Window {
    width: 1280
    height: 960
    visible: true
    title: qsTr("Live reloading")

    Loader {
        id: _loader

        // function reload() {
        //     source = "";
        //     source = "Circle.qml";
        // }

        function reload() {
            source = "";
            $QmlEngine.clearComponentCache();
            source = "Circle.qml";
        }

        anchors.centerIn: parent
        height: parent.height/2
        width: height
        source: "./Circle.qml"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: _loader.reload();
    }
}
