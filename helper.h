#ifndef HELPER_H
#define HELPER_H

#include <QObject>
#include <QVector>

class Helper : public QObject
{
    Q_OBJECT
public:
    explicit Helper(QObject *parent = nullptr);

signals:

public slots:
    QVector<int> newGame();
    QVector<bool> light(QVector<int> bricks, QVector<bool> post, QVector<bool> chosen);
    void win();
    void timeout();
};

#endif // HELPER_H
