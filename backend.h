#ifndef BACKEND_H
#define BACKEND_H

#include <QMainWindow>
#include <QObject>
#include <QWidget>
#include "cryptocontroller.h"


class backend
{
    Q_OBJECT
public:
    int sum3cards;
    cryptoController CC;
    backend();
    QString** genRandom9Cards();
    void summingCards(int digit);
    void resetGame();
    int getCard(QString card);

public slots:

private:


signals:


};

#endif // BACKEND_H
