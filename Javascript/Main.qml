import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Javascript")

    Component.onCompleted: {
        let obj1 = 24;
        let obj2 = {
            value: 42,
            label: "fourty two"
        };
        let obj3 = {
            value: 42,
            label: ""
        };

        console.log(obj1.label ?? obj1);
        console.log(obj2.label ?? obj2);
        console.log(obj3.label ?? obj3);
    }
}
