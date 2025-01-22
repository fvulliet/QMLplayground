import QtQuick

Window {
    id: root
    objectName: "root"
    width: 1280
    height: 960
    visible: true
    title: qsTr("navigation")

    QtObject {
        id: _
        property int currentPage: 0
    }

    Column {
        objectName: "mainColumn"
        anchors.fill: parent

        Row {
            id: content
            objectName: "content"
            width: parent.width
            height: parent.height - footer.height
            spacing: 10

            SideBar {
                id: sidebar
                height: parent.height
                width: (parent.width-parent.spacing)/6
                currentSelection: _.currentPage
                onCurrentSelectionChanged: _.currentPage = currentSelection
                tabs: ["page0", "page1", "page2"]
                focus: true

                Keys.onPressed: (event)=> {
                    if (event.key == Qt.Key_Right) {
                        event.accepted = true;
                        pageLoader.focus = true;
                    }
                }
            }
            Loader {
                id: pageLoader
                height: parent.height
                width: (parent.width-parent.spacing)*5/6
                source: {
                    switch (_.currentPage) {
                    case 1:
                        return "./Page1.qml"
                    case 2:
                        return "./Page2.qml"
                    default:
                        return "./Page0.qml"
                    }
                }
                onLoaded: pageLoader.item.focus = true;

                Keys.onPressed: (event) => {
                    if (event.key == Qt.Key_Left) {
                        event.accepted = true;
                        sidebar.focus = true;
                    }
                }
            }
        }

        Rectangle {
            id: footer
            objectName: "footer"
            width: parent.width
            height: 50
            color: "lightgray"

            Text {
                anchors.fill: parent
                font.pixelSize: height/2
                text: Window.activeFocusItem ? Window.activeFocusItem : ""
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
