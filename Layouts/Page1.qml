import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    color: "lightgray"

    // items come with their own size, they "impose" their dimensions to the container.
    // the layout manages the distribution of the items according to the provided constraints.

    Rectangle {
        id: container1
        height: parent.height
        width: parent.width/2
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter

        // 1. automatic distribution, automatic sizing
        // ColumnLayout {
        //     width: parent.width
        //     height: parent.height
        //     spacing: 0

        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.fillHeight: true // auto size
        //         color: "yellow"
        //     }
        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.fillHeight: true // auto size
        //         color: "red"
        //     }
        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.fillHeight: true // auto size
        //         color: "blue"
        //     }
        // }

        // 2. automatic distribution, imposed sizing
        // ColumnLayout {
        //     width: parent.width
        //     height: parent.height
        //     spacing: 0

        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 100 // imposed
        //         color: "yellow"
        //     }
        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 150 // imposed
        //         color: "red"
        //     }
        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 200 // imposed
        //         color: "blue"
        //     }
        // }

        // 3. no automatic distribution, imposed sizing
        // ColumnLayout {
        //     width: parent.width
        //     height: 0
        //     spacing: 0

        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 100 // imposed
        //         color: "yellow"
        //     }
        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 150 // imposed
        //         color: "red"
        //     }
        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 200 // imposed
        //         color: "blue"
        //     }
        // }

        // 4. no automatic distribution, imposed sizing, spacing
        // ColumnLayout {
        //     width: parent.width
        //     height: 0
        //     spacing: 20

        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 100 // imposed
        //         color: "yellow"
        //     }
        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 150 // imposed
        //         color: "red"
        //     }
        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 200 // imposed
        //         color: "blue"
        //     }
        // }

        // 5. combining automatic sizing and fixed sizing
        // ColumnLayout {
        //     width: parent.width
        //     height: parent.height
        //     spacing: 10

        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 100 // imposed
        //         color: "yellow"
        //     }
        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.fillHeight: true // auto size
        //         color: "red"
        //     }
        //     Tile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 200 // imposed
        //         color: "blue"
        //     }
        // }

        // 6. items have an implicit height, no auto distribution
        // ColumnLayout {
        //     width: parent.width
        //     height: 0
        //     spacing: 0

        //     SizedTile {
        //         Layout.fillWidth: true
        //         color: "yellow"
        //     }
        //     SizedTile {
        //         Layout.fillWidth: true
        //         color: "red"
        //     }
        //     SizedTile {
        //         Layout.fillWidth: true
        //         color: "blue"
        //     }
        // }

        // 7. items have an implicit height, auto distribution
        // ColumnLayout {
        //     width: parent.width
        //     height: parent.height
        //     spacing: 0

        //     SizedTile {
        //         Layout.fillWidth: true
        //         color: "yellow"
        //     }
        //     SizedTile {
        //         Layout.fillWidth: true
        //         color: "red"
        //     }
        //     SizedTile {
        //         Layout.fillWidth: true
        //         color: "blue"
        //     }
        // }

        // 8. items have an implicit height, no auto distribution, override height with preferredHeight
        // ColumnLayout {
        //     width: parent.width
        //     spacing: 0

        //     SizedTile {
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 100
        //         color: "yellow"
        //     }
        //     SizedTile {
        //         Layout.fillWidth: true
        //         color: "red"
        //     }
        //     SizedTile {
        //         Layout.fillWidth: true
        //         color: "blue"
        //     }
        // }

        // 9. items have an implicit height, no auto distribution, override height with mini/maxi
        ColumnLayout {
            width: parent.width
            height: parent.height // having 0 here makes no sense, because we're applying constraints about auto sizing
            spacing: 0

            SizedTile {
                Layout.fillWidth: true
                Layout.fillHeight: true // this is required if we want to consider the minimumHeight constraint
                Layout.minimumHeight: 200
                color: "yellow"
            }
            SizedTile {
                Layout.fillWidth: true
                Layout.fillHeight: true // this is required if we want to consider the maximumHeight constraint
                Layout.maximumHeight: 100
                color: "red"
            }
            SizedTile {
                Layout.fillWidth: true
                Layout.fillHeight: true // this is required if we want to consider the minimumHeight constraint
                Layout.minimumHeight: 100
                Layout.maximumHeight: 200
                color: "blue"
            }
        }
    }
}
