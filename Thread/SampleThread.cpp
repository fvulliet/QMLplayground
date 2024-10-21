#include <QDebug>
#include <QThread>

#include "SampleThread.hpp"

SampleThread::SampleThread()
{

}

SampleThread::~SampleThread()
{

}

bool SampleThread::working() const
{
    return m_working;
}

void SampleThread::setWorking(bool v)
{
    if (m_working != v) {
        m_working = v;
        emit workingChanged();
    }
}

void SampleThread::doWork(int n)
{
    setWorking(true);
    for (int i=0; i<n; i++) {
        qDebug() << i;
        QThread::msleep(100);
    }
    emit workDone();
}
