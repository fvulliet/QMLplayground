#include "Attribute.hpp"

Attribute::Attribute(QString label, int type, QVariant value, QObject *parent) :
    QObject(),
    m_label(label),
    m_type(type),
    m_value(value)
{
}

Attribute::Attribute(const Attribute &other) :
    QObject(),
    m_label(other.m_label),
    m_type(other.m_type),
    m_value(other.m_value)
{
}

Attribute &Attribute::operator =(const Attribute &other)
{
    if (this != &other)
    {
        m_label = other.m_label;
        m_type = other.m_type;
        m_value = other.m_value;
    }
    return *this;
}

Attribute::~Attribute()
{

}

bool Attribute::Attribute::operator ==(const Attribute &other)
{
    return m_label == other.m_label &&
           m_type == other.m_type &&
           m_value == other.m_value;
}

QString Attribute::label() const
{
    return m_label;
}

int Attribute::type() const
{
    return m_type;
}

QVariant Attribute::value() const
{
    return m_value;
}

void Attribute::setValue(QVariant value)
{
    if (m_value != value) {
        m_value = value;
        emit valueChanged();
    }
}
