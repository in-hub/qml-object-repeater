if(WITH_QT6)
	find_package(Qt6 COMPONENTS Core Qml REQUIRED)
else()
	find_package(Qt5 COMPONENTS Core Qml REQUIRED)
endif()

set(CMAKE_AUTOMOC TRUE)

set(qor_PUBLIC_HEADERS
	src/QmlObjectRepeater.h
	src/QmlObjectRepeaterPrivate.h
	)

add_library(qml-object-repeater SHARED
	src/QmlObjectRepeater.cpp
	${qor_PUBLIC_HEADERS}
)

if(WITH_QT6)
	find_package(Qt6 COMPONENTS QmlModels REQUIRED)
	target_link_libraries(qml-object-repeater PRIVATE Qt6::Core Qt6::CorePrivate Qt6::Qml Qt6::QmlPrivate Qt6::QmlModelsPrivate)
else()
	target_link_libraries(qml-object-repeater PRIVATE Qt5::Core Qt5::CorePrivate Qt5::Qml Qt5::QmlPrivate)
	if(${Qt5Qml_VERSION} VERSION_GREATER_EQUAL 5.15)
		find_package(Qt5 COMPONENTS QmlModels REQUIRED)
		target_link_libraries(qml-object-repeater PRIVATE Qt5::QmlModels)
	endif()
endif()

target_include_directories(qml-object-repeater
	PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src
	PRIVATE ${Qt5QmlModels_PRIVATE_INCLUDE_DIRS}
	)

set_target_properties(qml-object-repeater PROPERTIES
	LINK_FLAGS "-Wl,-no-undefined"
	INSTALL_RPATH_USE_LINK_PATH TRUE
	SKIP_BUILD_RPATH FALSE
	SKIP_INSTALL_RPATH FALSE
)

install(TARGETS qml-object-repeater LIBRARY)
install(FILES ${qor_PUBLIC_HEADERS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/qml-object-repeater)
