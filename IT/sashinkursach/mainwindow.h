#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QStandardItemModel>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    QStandardItemModel* data;

private slots:
    void on_pushButton_2_clicked();

    void on_goButton_clicked();

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
