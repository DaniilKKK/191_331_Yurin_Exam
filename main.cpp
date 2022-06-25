#include <QApplication>
#include <QQmlApplicationEngine>
#include <QCryptographicHash>
#include "cryptocontroller.h"
#include <QObject>
#include <QQmlContext>
#include <Windows.h>
#include <QMessageBox>
#include <QProcess>
#include <atlstr.h>

typedef unsigned long long QWORD;



int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;                                               // создание объекта движка/интерпретатора QML

//    QByteArray data = "ff*rt8ferg__=-*&YT";
//    data = QCryptographicHash::hash(data, QCryptographicHash::Md5);
//    qDebug() << data;


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    cryptoController crp;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("cryptoController", &crp);

    // БЛОК ЗАЩИТЫ ОТ ОТЛАДКИ МЕТОДОМ САМООТЛАДКИ
        QProcess *satelliteProcess = new QProcess();
        int pid = QApplication::applicationPid();
        qDebug() << "pid = " << pid;
        QStringList arguments = {QString::number(pid)};
        qDebug() << "arguments = " << arguments;
        satelliteProcess->start("DebugProtector.exe", arguments);
        bool ProtectorStarted = satelliteProcess->waitForStarted(1000);
        qDebug() << "ProtectorStarted = " << ProtectorStarted;


        engine.load(url);

    return app.exec();
}
