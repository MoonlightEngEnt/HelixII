# Add more folders to ship with the application, here
folder_01.source = qml/Helix2Qt
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    controllerinterface.cpp \
    Model/diagnostics.cpp \
    guicontrollercommon.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    controllerinterface.h \
    Model/diagnostics.h \
    guicontrollercommon.h

OTHER_FILES += \
    qml/Helix2Qt/Widgets/VerticalButtons.qml \
    qml/Helix2Qt/Widgets/TitleWidget.qml \
    qml/Helix2Qt/Widgets/DrinkViewWidget.qml \
    qml/Helix2Qt/CompoundWidgets/DrinkWidgetColumn.qml
