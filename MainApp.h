#ifndef MAINAPP_H
#define MAINAPP_H

#include <QObject>
#include <QQmlApplicationEngine>

class MainApp : public QObject {
    Q_OBJECT

public:
    explicit MainApp(QQmlApplicationEngine *engine, bool isoArgument, QObject *parent = nullptr);

public slots:
    void openNewQml();
    void startJourney();
    void closeCurrentWindow();

private:
    QQmlApplicationEngine *m_engine; // Store the engine pointer
    bool m_openInstallQml;
};

#endif // MAINAPP_H
