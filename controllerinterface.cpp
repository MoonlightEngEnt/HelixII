#include "controllerinterface.h"

ControllerInterface::ControllerInterface(QObject *parent) :
    QObject(parent)
{
    udpSocket = new QUdpSocket(this);
    udpSocket->bind( 54499, QUdpSocket::ShareAddress);
    connect(udpSocket, SIGNAL(readyRead()), this, SLOT(receiveMessage()));

    //Client Sender
    udpSocketSender = new QUdpSocket(this);
}
void ControllerInterface::sendCleaning()
{
    d.data = "Cleaning....";
    d.payload_size = d.data.size();

    QByteArray dgram;
    quint32 tmp =GUI_CLEANING;
    QDataStream out(&dgram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_4_3);
    out << QString::number(tmp) <<  QString::number(d.payload_size) << d.data;
    udpSocketSender->writeDatagram(dgram.data(),dgram.size(),QHostAddress::Broadcast,54498 );
}
void ControllerInterface::receiveMessage()
{


    while(udpSocket->hasPendingDatagrams()){
        QByteArray datagram;
        datagram.resize(udpSocket->pendingDatagramSize());
        udpSocket->readDatagram(datagram.data(),datagram.size());
        for(int i=0; i < datagram.size(); i++) {
            qDebug() << "Reading: "  << i << " " << datagram.at(i);
        }
        transporter f;
        QString t1,t2,t3;
        QDataStream in(&datagram, QIODevice::ReadOnly);
        in.setVersion(QDataStream::Qt_4_3);
        in >> t1 >> t2 >> t3;

        qDebug() << "Reading UDP: " << t1 << " " << t3;
        switch(t1.toInt()){
        case CTR_CLEANING_DONE:


            //Send update to GUI
            emit cleaningDone(t3);

            break;

        }
    }


}

void ControllerInterface::sendMessage()
{
    d.data = "ERROR Here";
    d.payload_size = d.data.size();

    QByteArray dgram;
    qDebug() << "Sending UDP: " << CTR_SEND_STARTED << " " << d.data;
    quint32 tmp =CTR_SEND_STARTED;
    QDataStream out(&dgram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_4_3);
    out << QString::number(tmp) <<  QString::number(d.payload_size) << d.data;
    udpSocketSender->writeDatagram(dgram.data(),dgram.size(),QHostAddress::Broadcast,54499 );


}
