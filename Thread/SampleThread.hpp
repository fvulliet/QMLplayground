#ifndef SAMPLETHREAD_HPP
#define SAMPLETHREAD_HPP

#include <QObject>

class SampleThread: public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool working READ working WRITE setWorking NOTIFY workingChanged FINAL)

public:
    SampleThread();
    ~SampleThread();

    bool working() const;
    void setWorking(bool);

    Q_INVOKABLE void doWork(int n = 100);

signals:
    void workDone();
    void workingChanged();

private:
    bool m_working = false;
};

#endif
