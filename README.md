QML Object Repeater
===================

The QmlObjectRepeater class implements a repeater for QObject-based
objects in QML. Unlike QQuickRepeater which only works for QtQuick items
the QmlObjectRepeater also works for non-graphical QML applications
without requiring the QtQuick module at all.

The implementation is based on QQuickRepeater and is nearly identical.
It only eliminates the QtQuick specifics and adds missing API parts
originally inherited from QQuickItem.

Copyright (c) 2018 in.hub GmbH

Build and installation
----------------------

* Configure and build project via "qmake" and "make"
* Install library and headers via "make install"

Usage
-----

* Add qml_object_repeater to CONFIG in your Qt project
* Include "QmlObjectRepeater.h" in your source file(s)
* Register the QmlObjectRepeater or derived subclasses in the QML system
  via qmlRegisterType():

    `qmlRegisterType<QmlObjectRepeater>("MyApp", 1, 0, "ObjectRepeater")`

* Use the repeater in your QML application

  ```
  ObjectRepeater {
      model: [ "Some", "model", "data" ]
      MyObject {
          name: "My object " + index
          data: modelData
      }
  }
  ```

* See https://doc.qt.io/qt-5/qml-qtquick-repeater.html for more details
  on repeaters in general
