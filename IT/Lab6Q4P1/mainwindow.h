#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <work.h>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_run_R_clicked();

    void on_run_N_clicked();

    void on_run_B_clicked();

private:
    Ui::MainWindow *ui;
    Work kitchen;
};

#endif // MAINWINDOW_H
