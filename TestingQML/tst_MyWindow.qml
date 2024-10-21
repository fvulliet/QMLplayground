import QtQuick
import QtTest

Item {
    // unit under test UUT
    MyWindow {
        id: myWindowTest
    }

    // test cases (requires import QtTest)
    TestCase {
        name: "TestButtonClick" // this name is used in the test output logs
        when: windowShown

        function test_clickButton() {
            verify(myWindowTest.color == "#ff0000", "before click, the color should be red");
            verify(myWindowTest.text === "not clicked", "before click, the text should be not clicked");
            mouseClick(myWindowTest.button)
            verify(myWindowTest.color == "#00ff00", "after click, the color should be green");
            verify(myWindowTest.text === "clicked", "after click, the text should be clicked");
        }
    }
}
