#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QTableView>
 #include <QStandardItemModel>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    data = new QStandardItemModel();
    ui->tableView->setModel(data);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_2_clicked()
{
    QStandardItem *item = new QStandardItem ();
    data->appendRow(item);
    QList<QStandardItem*> items;
    items.append(new QStandardItem ());
    data->appendColumn(items);
}
