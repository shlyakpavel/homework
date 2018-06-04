#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <work.h>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QRegExp int_exp("[0-9]*");
    ui->num_input->setValidator(new QRegExpValidator(int_exp, this));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    Work *work_obj = new Work;

    QString toSetText;

    unsigned long long number = ui->num_input->text().toLongLong();

    auto start = std::chrono::high_resolution_clock::now();

    auto total_number = work_obj->first_alg(number);

    auto finish = std::chrono::high_resolution_clock::now();

    std::chrono::duration<double> elapsed = finish - start;


    ui->res_1->setText(toSetText.setNum(total_number));

    ui->time_1->setText(toSetText.setNum(elapsed.count()));
}

void MainWindow::on_pushButton_2_clicked()
{
    Work *work_obj = new Work;

   QString toSetText;

   auto number = ui->num_input->text().toLongLong();


   auto start = std::chrono::high_resolution_clock::now();

   auto total_number = work_obj->second_alg(number);

   auto finish = std::chrono::high_resolution_clock::now();

   std::chrono::duration<double> elapsed = finish - start;


   ui->res_2->setText(toSetText.setNum(total_number));

   ui->time_2->setText(toSetText.setNum(elapsed.count()));
}
