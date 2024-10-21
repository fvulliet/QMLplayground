cmake_minimum_required(VERSION 3.16)

project(Focus1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appFocus1
    main.cpp
)

qt_add_qml_module(appFocus1
    URI FocusApp
    VERSION 1.0
    QML_FILES
        Main.qml
        MyRectangle.qml
        Header.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appFocus1 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appFocusApp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appFocus1
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appFocus1
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
