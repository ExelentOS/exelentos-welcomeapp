#ifndef COMMAND_EXECUTOR_H
#define COMMAND_EXECUTOR_H

#include <QObject>
#include <QProcess>
#include <QString>

class CommandExecutor : public QObject {
    Q_OBJECT

public:
    explicit CommandExecutor(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE QString executeCommand(const QString &command) {
        QProcess process;
        process.setProgram("bash");
        process.setArguments({"-c", command});

        process.start();
        if (!process.waitForFinished()) {
            return "Command failed to execute.";
        }

        // Capture output
        QString output = process.readAllStandardOutput();
        QString errorOutput = process.readAllStandardError();

        if (!errorOutput.isEmpty()) {
            return QString("Error: %1").arg(errorOutput.trimmed());
        }

        return output.trimmed();
    }
};

#endif // COMMAND_EXECUTOR_H
