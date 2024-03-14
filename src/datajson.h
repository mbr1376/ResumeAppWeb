#ifndef DATAJSON_H
#define DATAJSON_H

#include <QObject>
namespace JSON {

class DataJson;

class DataJson : public QObject
{
    Q_OBJECT
public:
    explicit DataJson(QObject *parent = nullptr);

signals:
};
}
#endif // DATAJSON_H
