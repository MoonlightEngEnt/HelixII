#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include "controllerinterface.h"
#include "Model/diagnostics.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);\

    ControllerInterface cInterface;
    Diagnostics diagnostics;

    QObject::connect(&diagnostics, SIGNAL(sendCleaning()),&cInterface, SLOT(sendCleaning()));
    QObject::connect(&cInterface, SIGNAL(cleaningDone( QString)),&diagnostics, SIGNAL(cleaningDone( QString)));

    QtQuick2ApplicationViewer viewer;
    QQmlContext *context = viewer.rootContext();
    viewer.rootContext()->setContextProperty("diagnostics", &diagnostics);
    viewer.setMainQmlFile(QStringLiteral("qml/Helix2Qt/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
