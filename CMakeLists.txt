# Qt automocing depends on version 2.8.6
cmake_minimum_required(VERSION 2.8.6)

if(CMAKE_BUILD_TYPE STREQUAL "")
set (CMAKE_BUILD_TYPE Release CACHE STRING "One of: None Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif()

# Project name
project(libra)

# Setup some directories
set(PROJECT_SOURCE_DIR "src")
set(PROJECT_BINARY_DIR "build")

set(CMAKE_AUTOMOC TRUE)

# Attempt to get a git version number
find_program(GIT_PATH git)
IF(${GIT_PATH} STREQUAL "GIT_PATH-NOTFOUND")
	set(GIT_VERSION "unknown")
ELSE()
	EXEC_PROGRAM("${GIT_PATH} describe --tags" OUTPUT_VARIABLE GIT_VERSION CACHE STRING)
ENDIF()

SET(GIT_VERSION "${GIT_VERSION}")
site_name(HOST_NAME)

# Update the version number in the Config.h file
configure_file (
	"${PROJECT_SOURCE_DIR}/Config.h.in"
	"${PROJECT_SOURCE_DIR}/Config.h"
)

# Find ALL OF THE FILES!
file(GLOB_RECURSE libra_SOURCE "src/*.cpp")
file(GLOB_RECURSE libra_FORMS "src/*.ui")
file(GLOB_RECURSE libra_RESOURCES "src/*.qrc")

#message("source: ${libra_SOURCE}")
message("forms: ${libra_FORMS}")
message("resources: ${libra_RESOURCES}")

find_package(Qt COMPONENTS QtCore QtGui QtMain REQUIRED)

# Process all of the Qt stuff
QT4_WRAP_UI(libra_FORMS_UIC ${libra_FORMS})
QT4_ADD_RESOURCES(libra_RESOURCES_RCC ${libra_RESOURCES})

# List the files that are required for the build
add_executable(libra WIN32 ${libra_SOURCE} ${libra_RESOURCES_RCC} ${libra_FORMS_UIC})

#if(CMAKE_BINARY_DIR EQUAL CMAKE_SOURCE_DIR)
	set(EXECUTABLE_OUTPUT_PATH "bin")
	set_target_properties(libra PROPERTIES RUNTIME_OUTPUT_DIRECTORY_DEBUG "./bin")
	set_target_properties(libra PROPERTIES RUNTIME_OUTPUT_DIRECTORY_RELEASE "./bin")
	message("Binaries stored in './bin'")
#else()
#	set(EXECUTABLE_OUTPUT_PATH "../bin")
#	set_target_properties(libra PROPERTIES RUNTIME_OUTPUT_DIRECTORY_DEBUG "../bin")
#	set_target_properties(libra PROPERTIES RUNTIME_OUTPUT_DIRECTORY_RELEASE "../bin")
#	message("Binaries stored in '../bin'")
#endif()

# Qt seems to need this for some reason
include(${QT_USE_FILE})

STRING(REGEX REPLACE "[.]lib" ".dll" QT_DLLS ${QT_LIBRARIES})
STRING(REGEX REPLACE "lib" "bin" QT_DLLS ${QT_DLLS})
STRING(REGEX REPLACE "[.]dll" ".dll;" QT_DLLS ${QT_DLLS})
foreach(dll ${QT_DLLS})
    IF ("${dll}" MATCHES "debug")
        STRING(REGEX REPLACE "^debug" "" dll ${dll})
        SET(QT_DEBUG_DLLS ${QT_DEBUG_DLLS} ${dll})
    elseif ("${dll}" MATCHES "optimized")
        STRING(REGEX REPLACE "^optimized" "" dll ${dll})
        SET(QT_RELEASE_DLLS ${QT_RELEASE_DLLS} ${dll})
    endif()
endforeach(dll)
STRING(REGEX REPLACE "[.]dll" ".dll;" QT_DEBUG_DLLS ${QT_DEBUG_DLLS})
message("Debug: " ${QT_DEBUG_DLLS})
STRING(REGEX REPLACE "[.]dll" ".dll;" QT_RELEASE_DLLS ${QT_RELEASE_DLLS})
message("Release: " ${QT_RELEASE_DLLS})

# Include the various folders where files are generated
include_directories(${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_SOURCE_DIR} ${QT_INCLUDE_DIR} ${QT_INCLUDE_PATH})
target_link_libraries(libra ${QT_LIBRARIES})


# Add some definitions that are only needed on windows
if(WIN32)
	add_definitions(-D_CRT_SECURE_NO_WARNINGS)
	target_link_libraries(libra ${QT_QTMAIN_LIBRARY})
	get_target_property(runtime_OUT_DIR libra RUNTIME_OUTPUT_DIRECTORY_DEBUG)
    IF (CMAKE_BUILD_TYPE STREQUAL "Debug")
        FOREACH(dll ${QT_DEBUG_DLLS})
            add_custom_command(TARGET libra POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${dll} ${runtime_OUT_DIR})
        ENDFOREACH()
    ELSE()
        FOREACH(dll ${QT_RELEASE_DLLS})
            add_custom_command(TARGET libra POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${dll} ${runtime_OUT_DIR})
        ENDFOREACH()
    ENDIF ()
endif(WIN32)

message("${EXECUTABLE_OUTPUT_PATH}")
#set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR})
#install(CODE "INCLUDE(BundleUtilities)
#fixup_bundle(../bin/libra.exe \"\" \"${QT_BINARY_DIR}\")")
#install(CODE "include(DeployQt4)
#message(${EXECUTABLE_OUTPUT_PATH}/libra${CMAKE_EXECUTABLE_SUFFIX})
#INSTALL_QT4_EXECUTABLE(${EXECUTABLE_OUTPUT_PATH}/libra${CMAKE_EXECUTABLE_SUFFIX})")
include(DeployQt4)
set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/${EXECUTABLE_OUTPUT_PATH})
install_qt4_executable(libra${CMAKE_EXECUTABLE_SUFFIX} "qico")