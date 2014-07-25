#ifndef DIAGNOSTICS_H
#define DIAGNOSTICS_H

#include <QObject>
#include <QString>

class Diagnostics : public QObject
{
    Q_OBJECT
public:
    explicit Diagnostics(QObject *parent = 0);

signals:
    void sendCleaning();
    void cleaningDone(const QString message);

public slots:

};

#endif // DIAGNOSTIC_H
