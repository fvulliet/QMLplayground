cmake_minimum_required(VERSION 3.16)

project(MapToItem VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appMapToItem
    main.cpp
)

qt_add_qml_module(appMapToItem
    URI MapToItem
    VERSION 1.0
    QML_FILES
        Collisions.qml
        Coordinates.qml
        DragDrop.qml
        Header.qml
        Inputs.qml
        Main.qml
        Popups.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appMapToItem PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appMapToItem
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appMapToItem
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appMapToItem
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
