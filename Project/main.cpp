#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "connection.h"

int main(int argc, char *argv[])
{
//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
//    QGuiApplication app(argc, argv);

//    if (!createConnection())
//        return 1;
//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QLatin1String("qrc:/MainPage.qml")));

//    return app.exec();
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/MainPage.qml")));

    return app.exec();
}
