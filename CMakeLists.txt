cmake_minimum_required(VERSION 3.16)

project(exelentos-welcome VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)  # Specify the C++ standard explicitly
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Specify the minimum Qt version and required components
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

# Specify the QRC file path
set(QRC_FILE "${CMAKE_CURRENT_SOURCE_DIR}/resources/resources.qrc")

# Check if the QRC file exists
if(NOT EXISTS ${QRC_FILE})
    message(FATAL_ERROR "QRC file not found: ${QRC_FILE}")
endif()

# Add resources from QRC file
qt_add_resources(appexelentos-welcome "resources/resources.qrc" PREFIX "" FILES ${QRC_FILE})

add_custom_target(
    generate_resources
    COMMAND rcc ${QRC_FILE} -o ${CMAKE_CURRENT_SOURCE_DIR}/src/resources.cpp
    DEPENDS ${QRC_FILE}
)


# Define the executable target
qt_add_executable(appexelentos-welcome
    src/main.cpp
    src/MainApp.cpp
    src/MainApp.h
    src/CommandExecutor.h
    ${appexelentos-welcome_resources}
)

add_dependencies(appexelentos-welcome generate_resources)
# Add QML module, ensuring `SOURCES` is not repeated
qt_add_qml_module(appexelentos-welcome
    URI exelentos-welcome
    VERSION 1.0
    QML_FILES resources/Main.qml
)

# Set bundle properties for macOS and Windows
set_target_properties(appexelentos-welcome PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)
# Link Qt6 libraries to the target
target_link_libraries(appexelentos-welcome
    PRIVATE Qt6::Quick
)

# Define install destinations
include(GNUInstallDirs)
install(TARGETS appexelentos-welcome
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

