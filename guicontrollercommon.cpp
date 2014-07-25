#include "guicontrollercommon.h"

QDataStream &operator<<(QDataStream &out, const transporter &t)
{
    out << (quint32)t.command_id << t.payload_size << t.data;
    return out;
}

QDataStream& operator >>(QDataStream& in, command_id_list& e)
{
    quint32 tmp = e;
    in >> tmp;
    return in;
}


QDataStream &operator>>(QDataStream &in, transporter &t)
{
    int id;
    int size;
    QString data;

    in >> id >> size >> data;
    t.command_id = (command_id_list)id;
    t.payload_size = size;
    t.data = data;
    return in;
}
