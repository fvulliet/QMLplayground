#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "SampleThread.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<SampleThread>("playground", 1, 0, "SampleThread");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/Thread/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
