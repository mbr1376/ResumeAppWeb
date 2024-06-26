cmake_minimum_required(VERSION 3.21.1)

option(LINK_INSIGHT "Link Qt Insight Tracker library" ON)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)

project(ResumeAppApp LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 6.1 REQUIRED COMPONENTS Core Gui Qml Quick Core5Compat)

if (Qt6_VERSION VERSION_GREATER_EQUAL 6.3)
    qt_standard_project_setup()
endif()

qt_add_executable(ResumeAppApp src/main.cpp
    src/datajson.h src/datajson.cpp
    res.qrc
)

qt_add_resources(ResumeAppApp "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
        resume.json
        content/fonts/RobotoSlab-ExtraBold.ttf
        content/fonts/RobotoSlab-Light.ttf

)

target_link_libraries(ResumeAppApp PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::Core5Compat
)

if (BUILD_QDS_COMPONENTS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/qmlcomponents)
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)

if (LINK_INSIGHT)
    include(${CMAKE_CURRENT_SOURCE_DIR}/insight)
endif ()

include(GNUInstallDirs)
install(TARGETS ResumeAppApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# make IDEs aware of the QML import path
set(QML_IMPORT_PATH ${PROJECT_BINARY_DIR}/qml CACHE PATH
    "Path to the custom QML components defined by the project")

