#ifndef DIAGNOSTICS_H
#define DIAGNOSTICS_H

#include <QObject>

class Diagnostics : public QObject
{
    Q_OBJECT
public:
    explicit Diagnostics(QObject *parent = 0);

signals:
    void cleaning();

public slots:
    Q_INVOKABLE void holding();

};

#endif // DIAGNOSTICS_H
