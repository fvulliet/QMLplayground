#include <QVariant>

#include "myModel.hpp"

MyModel::MyModel(QObject *parent)
{
}

MyModel::~MyModel()
{
}

int MyModel::rowCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return m_elements.size();
    else
        return 0;
}

int MyModel::columnCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : COLCOUNT;
}

QVariant MyModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    else if (index.row() < 0 || index.row() >= m_elements.count())
        return QVariant();

    int col;
    if (role >= Qt::UserRole)
        col = MyModel::toColumn(static_cast<Role>(role));
    else if (role != Qt::DisplayRole && role != Qt::EditRole)
        return QVariant();
    else
        col = index.column();

    switch (col)
    {
    case LabelColumn:
        return m_elements.at(index.row()).label();
    case ValueColumn:
        return m_elements.at(index.row()).value();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> MyModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[LabelRole] = "label";
    roles[ValueRole] = "value";
    return roles;
}

int MyModel::toColumn(const Role &role)
{
    return static_cast<int>(role - Qt::UserRole);
}

void MyModel::appendElement(QString label, int value)
{
    Element elt(label, value);

    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_elements.append(elt);
    endInsertRows();
    emit myCountChanged();
}

QString MyModel::getLabel(const int &index) const
{
    if (index >= m_elements.count())
        return QString();
    return m_elements[index].label();
}

int MyModel::getValue(const int &index) const
{
    if (index >= m_elements.count())
        return -1;
    return m_elements[index].value();
}

