#ifndef __ELEMENT_HPP__
#define __ELEMENT_HPP__

#include <QString>

class Element
{
public:
    Element(QString, int);
    ~Element() = default;

    QString label() const;
    void setLabel(QString);

    int value() const;
    void setValue(int);

private:
    QString m_label;
    int m_value;
};

#endif // __ELEMENT_HPP__

