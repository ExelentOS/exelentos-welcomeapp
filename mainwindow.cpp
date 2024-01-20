#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->setStyleSheet("background-color: #353935;");
}

MainWindow::~MainWindow()
{
    delete ui;
}
void MainWindow::on_ok_clicked()
{
    system("rm ~/.config/autostart/welcome.desktop");
    system("kwalletmanager5 &");
    QApplication::quit();
}
void MainWindow::on_wifi_clicked()
{
    system("systemsettings kcm_users");
}
void MainWindow::on_time_clicked()
{
    system("systemsettings kcm_networkmanagement");
}
void MainWindow::on_lang_clicked()
{

}
