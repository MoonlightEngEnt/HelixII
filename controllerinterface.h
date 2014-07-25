#ifndef CONTROLLERINTERFACE_H
#define CONTROLLERINTERFACE_H

#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTcpSocket>
#include <QNetworkSession>
#include <QNetworkConfigurationManager>
#include <QSettings>
#include <QTcpServer>
#include <QUdpSocket>

#include "../../Helix2Qt/guicontrollercommon.h"


class ControllerInterface : public QObject
{
    Q_OBJECT
public:
    explicit ControllerInterface(QObject *parent = 0);

    //Received from Controller
signals:
   void cleaningDone(QString message);

public slots:
    //Client Receiver
    void receiveMessage();

    //Client Sender
    void sendMessage();

    void sendCleaning();
private:
    //Client Receiver
    QUdpSocket *udpSocket;

    //Client Sender
    QUdpSocket *udpSocketSender;
    transporter d;
};

#endif // CONTROLLERINTERFACE_H
