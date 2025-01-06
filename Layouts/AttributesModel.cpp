#include <QVariant>

#include "AttributesModel.hpp"

AttributesModel::AttributesModel(QObject *parent) :
    QAbstractListModel(parent)
{
}

AttributesModel::~AttributesModel()
{
}

int AttributesModel::rowCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return m_attributesList.size();
    else
        return 0;
}

int AttributesModel::columnCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : ATTRIBUTES_COLCOUNT;
}

QVariant AttributesModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    else if (index.row() < 0 || index.row() >= m_attributesList.count())
        return QVariant();

    int col;
    if (role >= Qt::UserRole)
        col = AttributesModel::toColumn(static_cast<Role>(role));
    else if (role != Qt::DisplayRole && role != Qt::EditRole)
        return QVariant();
    else
        col = index.column();

    switch (col)
    {
    case LabelColumn:
        return m_attributesList.at(index.row()).label();
    case TypeColumn:
        return m_attributesList.at(index.row()).type();
    case ValueColumn:
        return m_attributesList.at(index.row()).value();
    default:
        return QVariant();
    }
}

bool AttributesModel::setData(const QModelIndex &index, const QVariant &value,
                            int role)
{
    if (!index.isValid())
        return false;
    else if (index.row() < 0 || index.row() >= m_attributesList.count())
        return false;

    int col;
    if (role >= Qt::UserRole)
        col = AttributesModel::toColumn(static_cast<Role>(role));
    else if (role != Qt::DisplayRole && role != Qt::EditRole)
        return false;
    else
        col = index.column();

    switch (col)
    {
    case ValueColumn:
        m_attributesList[index.row()].setValue(value);
        break;
    }

    emit dataChanged(index, index);

    return true;
}

QHash<int, QByteArray> AttributesModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[LabelRole] = "label";
    roles[TypeRole] = "type";
    roles[ValueRole] = "value";
    return roles;
}

int AttributesModel::toColumn(const Role &role)
{
    return static_cast<int>(role - Qt::UserRole);
}

void AttributesModel::appendAttribute(QString label, int type, QVariant value)
{
    Attribute att(label, type, value);

    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_attributesList.append(att);
    endInsertRows();
}

QString AttributesModel::getLabel(const int &index) const
{
    if (index >= m_attributesList.count())
        return QString();
    return m_attributesList[index].label();
}

int AttributesModel::getType(const int &index) const
{
    if (index >= m_attributesList.count())
        return -1;
    return m_attributesList[index].type();
}

QVariant AttributesModel::getValue(const int &index) const
{
    if (index >= m_attributesList.count())
        return QVariant();
    return m_attributesList[index].value();
}

