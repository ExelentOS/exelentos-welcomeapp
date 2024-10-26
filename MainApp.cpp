#include "MainApp.h"
#include <QQuickWindow>
#include <QDebug>

MainApp::MainApp(QQmlApplicationEngine *engine, bool isoArgument, QObject *parent)
    : QObject(parent), m_engine(engine), m_openInstallQml(isoArgument) // Initialize m_engine and m_openInstallQml
{
    qDebug() << "openInstallQml is set to:" << m_openInstallQml;
}

void MainApp::startJourney() {
    qDebug() << "Journey Started!"; // Replace with actual functionality
}

void MainApp::openNewQml() {
    qDebug() << "Attempting to load install.qml";
    closeCurrentWindow();

    if (m_openInstallQml) {
        m_engine->load(QUrl(QStringLiteral("qrc:/install.qml")));
    } else {
        qDebug() << "ISO argument not passed; not opening install.qml.";
        m_engine->load(QUrl(QStringLiteral("qrc:/post.qml")));
    }
}

void MainApp::closeCurrentWindow() {
    if (QQuickWindow *window = qobject_cast<QQuickWindow *>(m_engine->rootObjects().first())) {
        window->close();
    }
}
