import QtQuick
import QtTest

TestCase {
    id: top
    name: "CreateBenchmark"

    function benchmark_create_component() {
        let component = Qt.createComponent("item.qml")
        let obj = component.createObject(top)
        obj.destroy()
        component.destroy()
    }
}
