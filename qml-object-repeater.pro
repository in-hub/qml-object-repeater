TEMPLATE = lib

QT += core-private qml qml-private
QT -= gui

TARGET = qml-object-repeater

INCLUDEPATH += src

HEADERS += src/QmlObjectRepeater.h src/QmlObjectRepeaterPrivate.h
SOURCES += src/QmlObjectRepeater.cpp

target.path = $$[QT_INSTALL_LIBS]
INSTALLS += target

headers.files = src/QmlObjectRepeater.h
headers.path = $$[QT_INSTALL_HEADERS]
INSTALLS += headers

features.files = features/*prf
features.path = $$[QT_HOST_DATA]/mkspecs/features
INSTALLS += features
