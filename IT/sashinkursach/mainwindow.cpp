#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QTableView>
#include <QStandardItemModel>
#include <math.h>

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

int n = 0;
int eps = 0;

bool converge(double *xk, double *xkp)
{
    double norm = 0;
    for (int i = 0; i < n; i++)
    {
        norm += (xk[i] - xkp[i])*(xk[i] - xkp[i]);
    }
    if (sqrt(norm) >= eps)
        return false;
    return true;
}

void MainWindow::on_goButton_clicked()
{

    eps= ui->accuracyinput->text().toInt();
    n = data->rowCount();
    double p[n], x[n];
    memset(x, 0, n*sizeof(double));
    do
    {
        for (int i = 0; i < n; i++)
            p[i] = x[i];

        for (int i = 0; i < n; i++)
        {
            double var = 0;
            for (int j = 0; j < i; j++)
                var += (data->item(i,j)->text().toInt() * x[j]);
            for (int j = i + 1; j < n; j++)
                var += (data->item(i,j)->text().toInt() * p[j]);
            int acc=data->item(i,n)->text().toInt();
            x[i] = (acc - var) / data->item(i,i)->text().toInt();
        }
    } while (!converge(x, p));
}
