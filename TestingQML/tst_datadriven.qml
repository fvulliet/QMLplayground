import QtQuick
import QtTest

TestCase {
    name: "DataTests"

    function init_data() {
        return [
            {tag:"check 1+2 = 3", a:1, b:2, answer: 3},
            {tag:"check 2+4 = 6", a:2, b:4, answer: 6}
        ];
    }

    function test_mytable_data() {
        return [
            {tag: "check 2+2 = 4", a: 2, b: 2, answer: 4 },
            {tag: "check 2+6 = 8", a: 2, b: 6, answer: 8 }
        ]
    }

    function test_mytable(data) {
        //data comes from test_mytable_data
        compare(data.a + data.b, data.answer)
    }

    function test_mydefault_table(data) {
        //data comes from init_xxxdata
        compare(data.a + data.b, data.answer)
    }
}
