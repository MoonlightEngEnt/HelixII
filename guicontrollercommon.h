#ifndef GUICONTROLLERCOMMON_H
#define GUICONTROLLERCOMMON_H

#include <stdint.h>

#include <QtGui>
#include <QByteArray>
#include <QDataStream>


typedef enum command_id_list {
    //GUI_  are messages from Gui to controller
        GUI_REQUEST_START,
        GUI_CLEANING,

    //CTR are messages from controller to GUI
        CTR_SEND_STARTED,
        CTR_CLEANING_DONE,
        CTR_SYSTEM_ERROR
} interface_id;

typedef struct payload_tranport{
    interface_id command_id;
    int payload_size;
    QString data;

} transporter;
QDataStream &operator<<(QDataStream &out, const transporter &t);
QDataStream &operator>>(QDataStream &in, transporter &t);
QDataStream& operator >>(QDataStream& in, command_id_list& e);
#endif // GUICONTROLLERCOMMON_H
