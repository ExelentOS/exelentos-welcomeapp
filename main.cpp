#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "resources.cpp"
#include "MainApp.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Create an instance of MainApp
    MainApp mainApp(&engine);

    // Expose the MainApp instance to QML
    engine.rootContext()->setContextProperty("mainApp", &mainApp);

    // Load the main QML file
    engine.loadFromModule("exelentos-welcome", "Main");

    return app.exec();
}
