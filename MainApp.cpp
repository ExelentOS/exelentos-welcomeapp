#include "MainApp.h"
#include <QDebug>

MainApp::MainApp(QQmlApplicationEngine *engine, QObject *parent)
    : QObject(parent), m_engine(engine) // Initialize m_engine
{
}

void MainApp::startJourney() {
    qDebug() << "Journey Started!"; // Replace with actual functionality
}

void MainApp::openNewQml() {
    m_engine->load(QUrl(QStringLiteral("qrc:/install.qml"))); // Update the path to your QML file
}
