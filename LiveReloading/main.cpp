#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqmlcontext.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    // we are exposing a global variable called $QmlEngine as a context property of the QmlEngine's root context.
    // This allows the $QmlEngine variable to be used from any QML file loaded inside this this particular engine.
    engine.rootContext()->setContextProperty("$QmlEngine", &engine);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.load(QUrl(qgetenv("MAIN_QML")));
    //engine.loadFromModule("LiveReloading", "Main");

    return app.exec();
}
