#include "helper.h"
#include <QDebug>
#include<QSet>
#include<QMap>
#include<QVector>
#include <QList>
#include <QRandomGenerator>


Helper::Helper(QObject *parent) : QObject(parent)
{

}

QVector<int> Helper::newGame()
{

    QVector<int> bricks;

    QVector<int> patern = {
            1, 1, 1, 1, 2, 2,
            2, 2, 3, 3, 3, 3,
            4, 4, 5, 5, 6, 6,
        };

    for (int i = 18; i >= 1; i--)
    {
        int value = rand() % i;
        bricks.push_back(patern[value]);
        patern.remove(value);
    }

    return bricks;
}

QVector<bool> Helper::light(QVector<int> bricks, QVector<bool> post, QVector<bool> chosen)
{
    QVector<bool> lights = post;
    QVector<int> h;

    for (int i = 0; i < 18; i++){
        if (chosen[i]) h.push_back(i);
    }

    if (bricks[h[0]] == bricks[h[1]]){
        lights[h[0]] = true;
        lights[h[1]] = true;
    }

    return lights;
}

void Helper:: win()
{
    qDebug()<<"win";
};
void Helper::timeout()
{
    qDebug()<<"timeout";
};
