#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <chrono>
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_run_R_clicked()
{
    long long res;
    kitchen.n = ui->spinBox->text().toInt();
    auto start = std::chrono::high_resolution_clock::now();
    res = kitchen.process_recursive();
    auto finish = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = finish - start;
    ui->time_R->setText(QString("Took %1 s").arg(elapsed.count()));
    ui->res_R->setText(QString("Result: %1").arg(res));
}

void MainWindow::on_run_N_clicked()
{
    long long res;
    kitchen.n = ui->spinBox->text().toInt();
    auto start = std::chrono::high_resolution_clock::now();
    res = kitchen.process_normal();
    auto finish = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = finish - start;
    ui->time_N->setText(QString("Took %1 s").arg(elapsed.count()));
    ui->res_N->setText(QString("Result: %1").arg(res));
}

void MainWindow::on_run_B_clicked()
{
    long long res;
    kitchen.n = ui->spinBox->text().toInt();
    auto start = std::chrono::high_resolution_clock::now();
    res = kitchen.process_bin();
    auto finish = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = finish - start;
    ui->time_B->setText(QString("Took %1 s").arg(elapsed.count()));
    ui->res_B->setText(QString("Result: %1").arg(res));
}
