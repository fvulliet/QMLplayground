#ifndef __MYMODEL_HPP__
#define __MYMODEL_HPP__

#include <QObject>
#include <QAbstractListModel>
#include <QtQml/qqmlregistration.h>
#include "Element.hpp"

#define COLCOUNT 2

class MyModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int myCount READ rowCount NOTIFY myCountChanged)
    Q_ENUMS(Role Column)
    QML_ELEMENT

public:
    explicit MyModel(QObject *parent = nullptr);

    ~MyModel();

    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    int columnCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    QHash<int, QByteArray> roleNames() const;

    enum Column {
        LabelColumn,
        ValueColumn
    };

    enum Role {
        LabelRole = Qt::UserRole + LabelColumn,
        ValueRole = Qt::UserRole + ValueColumn
    };

    static inline int toColumn(const Role &role);

    Q_INVOKABLE void appendElement(QString, int);

    Q_INVOKABLE QString getLabel(const int &index) const;
    Q_INVOKABLE int getValue(const int &index) const;

signals:
    void myCountChanged();

protected:
    QList<Element> m_elements;
};

#endif // __MYMODEL_HPP__
