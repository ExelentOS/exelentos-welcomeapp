#ifndef MAINAPP_H
#define MAINAPP_H

#include <QObject>
#include <QQmlApplicationEngine>

class MainApp : public QObject {
    Q_OBJECT

public:
    explicit MainApp(QQmlApplicationEngine *engine, QObject *parent = nullptr);

public slots:
    void openNewQml();
    void startJourney();
    void closeCurrentWindow();

private:
    QQmlApplicationEngine *m_engine; // Store the engine pointer
};

#endif // MAINAPP_H
