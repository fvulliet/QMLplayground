#ifndef __ATTRIBUTESMODEL_HPP__
#define __ATTRIBUTESMODEL_HPP__

#include <QObject>
#include <QAbstractListModel>
#include <QtQml/qqmlregistration.h>

#include "Attribute.hpp"

#define ATTRIBUTES_COLCOUNT 3

class AttributesModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ rowCount NOTIFY countChanged)
    Q_ENUMS(Role Column)
    QML_ELEMENT

public:
    explicit AttributesModel(QObject *parent = nullptr);

    ~AttributesModel();

    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    int columnCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole);
    QHash<int, QByteArray> roleNames() const;

    enum Column {
        LabelColumn,
        TypeColumn,
        ValueColumn
    };

    enum Role {
        LabelRole = Qt::UserRole + LabelColumn,
        TypeRole = Qt::UserRole + TypeColumn,
        ValueRole = Qt::UserRole + ValueColumn
    };

    static inline int toColumn(const Role &role);

    Q_INVOKABLE void appendAttribute(QString, int, QVariant);

    Q_INVOKABLE QString getLabel(const int &index) const;
    Q_INVOKABLE int getType(const int &index) const;
    Q_INVOKABLE QVariant getValue(const int &index) const;

signals:
    void countChanged();

protected:
    QList<Attribute> m_attributesList;
};

#endif // __ATTRIBUTESMODEL_HPP__
