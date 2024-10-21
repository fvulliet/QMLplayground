#include <QObject>
#include <QProperty> // Required for QProperty
#include <QtQml/qqmlregistration.h> // Required for QML_ELEMENT

class Rectangle : public QObject {
    Q_OBJECT

    Q_PROPERTY(int height READ height WRITE setHeight NOTIFY heightChanged BINDABLE bindableHeight)
    Q_PROPERTY(int width READ width WRITE setWidth NOTIFY widthChanged BINDABLE bindableWidth)
    Q_PROPERTY(int area READ area NOTIFY areaChanged BINDABLE bindableArea)

public:
    Rectangle() {
        m_area.setBinding([&] { return m_height * m_width; });
    }

    void setHeight(int h) { m_height = h; }
    int height() const { return m_height; }
    // QBindable: this is needed for retrieving bindings and accessing the functionality available in QProperty
    QBindable<int> bindableHeight() { return &m_height; }

    void setWidth(int w) { m_width = w; }
    int width() const { return m_width; }
    QBindable<int> bindableWidth() { return &m_width; }

    int area() const { return m_area; }
    QBindable<int> bindableArea() { return &m_area; }

signals:
    void heightChanged();
    void widthChanged();
    void areaChanged();

private:
    // Q_OBJECT_BINDABLE_PROPERTY is here to automatically emit the property-change notifications whenever
    // the value of the property changes. Before setting a new value, the setters don't need to check
    // if the new value actually differs from the old one and emit the property-change signals because
    // the bindable properties already do that behind the scenes.
    Q_OBJECT_BINDABLE_PROPERTY(Rectangle, int, m_height, &Rectangle::heightChanged)
    Q_OBJECT_BINDABLE_PROPERTY(Rectangle, int, m_width, &Rectangle::widthChanged)
    Q_OBJECT_BINDABLE_PROPERTY(Rectangle, int, m_area, &Rectangle::areaChanged)
};
