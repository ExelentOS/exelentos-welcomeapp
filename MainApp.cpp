#include "MainApp.h"
#include <QQuickWindow>
#include <QDebug>

MainApp::MainApp(QQmlApplicationEngine *engine, QObject *parent)
    : QObject(parent), m_engine(engine) // Initialize m_engine
{
}

void MainApp::startJourney() {
    qDebug() << "Journey Started!"; // Replace with actual functionality
}

void MainApp::openNewQml() {
    qDebug() << "Attempting to load install.qml";
    closeCurrentWindow();
    m_engine->load(QUrl(QStringLiteral("qrc:/install.qml"))); // Update the path to your QML file
}

void MainApp::closeCurrentWindow() {
    if (QQuickWindow *window = qobject_cast<QQuickWindow *>(m_engine->rootObjects().first())) {
        window->close();
    }
}
