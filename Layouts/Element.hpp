#ifndef __ELEMENT_HPP__
#define __ELEMENT_HPP__

#include <QObject>

#include "Attribute.hpp"

class Element : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Attribute minimumWidth READ minimumWidth WRITE setMinimumWidth NOTIFY minimumWidthChanged)
    Q_PROPERTY(Attribute maximumWidth READ maximumWidth WRITE setMaximumWidth NOTIFY maximumWidthChanged)

public:
    explicit Element(QObject *parent = nullptr);

    Attribute minimumWidth() const;
    void setMinimumWidth(Attribute value);

    Attribute maximumWidth() const;
    void setMaximumWidth(Attribute value);

signals:
    void minimumWidthChanged();
    void maximumWidthChanged();

private:
    Attribute m_minimumWidth;
    Attribute m_maximumWidth;
};

#endif // __ELEMENT_HPP__

