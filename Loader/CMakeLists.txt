cmake_minimum_required(VERSION 3.16)

project(Loader VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appLoader
    main.cpp
)

qt_add_qml_module(appLoader
    URI Loader
    VERSION 1.0
    QML_FILES
        Main.qml
        MenuBar.qml
        Page1.qml
        Page2.qml
        Page3.qml
        Page4.qml
        Page5.qml
    RESOURCES
        qt.jpg
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appLoader PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appLoader
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appLoader
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appLoader
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
