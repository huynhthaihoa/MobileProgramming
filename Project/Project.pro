QT += qml quick sql

CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets sql location
#LIBS += -LC:/OpenSSL-Win32/lib -lubsec
#INCLUDEPATH += C:/OpenSSL-Win32/include
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    connection.h
