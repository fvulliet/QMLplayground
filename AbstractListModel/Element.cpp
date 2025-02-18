#include "Element.hpp"

Element::Element(QString label, int value) :
    m_label(label),
    m_value(value)
{
}

QString Element::label() const
{
    return m_label;
}

void Element::setLabel(QString value)
{
    if (m_label == value)
        return;
    m_label = value;
}

int Element::value() const
{
    return m_value;
}

void Element::setValue(int value)
{
    if (m_value == value)
        return;
    m_value = value;
}
