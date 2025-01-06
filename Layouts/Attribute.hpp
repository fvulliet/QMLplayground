#ifndef __ATTRIBUTE_HPP__
#define __ATTRIBUTE_HPP__

#include <QObject>
#include <QVariant>

#include "Attribute.hpp"

class Attribute : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString label READ label)
    Q_PROPERTY(int type READ type)
    Q_PROPERTY(QVariant value READ value WRITE setValue NOTIFY valueChanged)

public:
    Attribute(QString label, int type, QVariant value, QObject *parent = nullptr);
    Attribute(const Attribute &other);
    Attribute &operator =(const Attribute &other);
    bool operator ==(const Attribute &other);

    ~Attribute();

    QString label() const;

    int type() const;

    QVariant value() const;
    void setValue(QVariant);

signals:
    void valueChanged();

private:
    QString m_label;
    int m_type;
    QVariant m_value;
};

#endif // __ATTRIBUTE_HPP__

