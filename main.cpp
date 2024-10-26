#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>
#include "resources.cpp"
#include "MainApp.h"
#include "CommandExecutor.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    bool isoArgument = false;
    for (int i = 1; i < argc; ++i) {
        if (QString(argv[i]) == "iso") {
            isoArgument = true;
            break;
        }
    }

    MainApp mainApp(&engine, isoArgument); // Pass isoArgument here
    engine.rootContext()->setContextProperty("mainApp", &mainApp);
    engine.loadFromModule("exelentos-welcome", "Main");
    qmlRegisterType<CommandExecutor>("execute", 1, 0, "CommandExecutor");
    QGuiApplication::setWindowIcon(QIcon(":/images/exelentos-icon.png"));
    return app.exec();
}
