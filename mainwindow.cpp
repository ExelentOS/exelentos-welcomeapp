#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->setStyleSheet("background-color: #414A4C;");
    system("sudo bash /usr/bin/kpmforever.sh &");
    system("sudo bash /usr/bin/mountsfs.sh &");
}

MainWindow::~MainWindow()
{
    delete ui;
}
void MainWindow::on_ok_clicked()
{
    system("rm ~/.config/autostart/welcome.desktop");
    QApplication::quit();
}
void MainWindow::on_wifi_clicked()
{
    system("sudo gparted");
}
void MainWindow::on_lang_clicked()
{
    system("sudo bash /usr/bin/calamares.sh");
}
