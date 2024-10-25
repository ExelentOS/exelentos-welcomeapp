cmake_minimum_required(VERSION 3.16)

project(exelentos-welcome VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appexelentos-welcome
    main.cpp
)

qt_add_qml_module(appexelentos-welcome
    URI exelentos-welcome
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES resources.qrc
        SOURCES MainApp.cpp
        SOURCES MainApp.h
        QML_FILES
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appexelentos-welcome PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appexelentos-welcome
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appexelentos-welcome
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appexelentos-welcome
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
