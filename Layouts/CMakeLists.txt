cmake_minimum_required(VERSION 3.16)

project(Layouts VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appLayouts
    main.cpp
    Element.hpp Element.cpp
    Attribute.hpp Attribute.cpp
    AttributesModel.hpp AttributesModel.cpp
)

qt_add_qml_module(appLayouts
    URI Layouts
    VERSION 1.0
    QML_FILES
        Main.qml
        MenuBar.qml
        Page1.qml
        Page2.qml
        Page3.qml
        Page4.qml
        Page5.qml
        SizedTile.qml
        Tile.qml
        WIP.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appLayouts PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appLayouts
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appLayouts
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appLayouts
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
