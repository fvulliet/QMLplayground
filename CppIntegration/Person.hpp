#include <QObject>
#include <QString>
#include <QtQml/qqmlregistration.h> // Required for QML_ELEMENT

class Person : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(int age MEMBER m_age NOTIFY ageChanged FINAL)
    QML_ELEMENT

public:
    enum MyEnum {
        Young = 10,
        Medium = 20,
        Old = 30
    };
    Q_ENUM(MyEnum)

    QString name() const { return m_name; }
    void setName(QString value) {
        if (m_name != value) {
            m_name = value;
            emit nameChanged();
        }
    }

signals:
    void nameChanged();
    void ageChanged();

private:
    QString m_name;
    int m_age;
};
