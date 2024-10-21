import QtQuick

Item {
    id: root

    property var initialModel: [{
        "title": root.title,
        // here, why is initialModel's "body" reevaluated when bodyList changes ?
        "body": _internal.parseBodyList()
        // note, the code could be also: "body": Qt.binding(function () { _internal.parseBodyList(); })
    }]

    property string title: ""
    property var bodyList: []

    QtObject {
        id: _internal
        property var bodyListParsed
        // If parseBodyList() took the list as an arg instead then perhaps it would not happen

        // create a new array of objects
        function parseBodyList() {
            console.log("-----parseBodyList")
            return root.bodyList.map(item => ({ "description": item }));
        }
    }

    Column {
        anchors.fill: parent

        Text {
            width: parent.width; height: parent.height/2
            text: "title: " + root.initialModel[0]["title"]
        }
        Repeater {
            id: repeat
            width: parent.width; height: parent.height/2
            model: root.initialModel[0]["body"]
            delegate: Text {
                width: repeat.width; height: 20
                text: Object.keys(modelData)[0] + ": "+ Object.values(modelData)[0]
            }
        }
    }
}
