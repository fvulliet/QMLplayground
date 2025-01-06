#include "Element.hpp"

Element::Element(QObject *parent) :
    QObject(parent),
    m_minimumWidth(Attribute(QString("minimumWidth"), 0, -1)),
    m_maximumWidth(Attribute(QString("maximumWidth"), 0, -1))
{
}

Attribute Element::minimumWidth() const
{
    return m_minimumWidth;
}

void Element::setMinimumWidth(Attribute value)
{
    if (m_minimumWidth == value)
        return;
    m_minimumWidth = value;
    emit minimumWidthChanged();
}

Attribute Element::maximumWidth() const
{
    return m_maximumWidth;
}

void Element::setMaximumWidth(Attribute value)
{
    if (m_maximumWidth == value)
        return;
    m_maximumWidth = value;
    emit maximumWidthChanged();
}
