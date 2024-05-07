#ifndef DATAJSON_H
#define DATAJSON_H

#include <QObject>
#include <QVariantList>
#include <QVariantMap>
namespace JSON {

class DataJson;

class DataJson : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList dataSkillList READ dataSkillList WRITE setDataSkillList NOTIFY dataSkillListChanged FINAL)
    Q_PROPERTY(int lenght READ lenght WRITE setLenght NOTIFY lenghtChanged FINAL)
public:
    explicit DataJson(QObject *parent = nullptr);
    bool fileExists(QString path);

    QVariantList dataSkillList() const;
    int lenght() const;
    Q_INVOKABLE void parse(QString nameModel);

public slots:
    void   setDataSkillList(const QVariantList& data);
    void setLenght(int value);
signals:
    void dataSkillListChanged(const QVariantList & data);
    void lenghtChanged(int  value);
private:

    QVariantList json2Variant(QJsonArray array, QString nameModel);
    QVariantList m_dataSkillList;
    int m_lenght{0};
    QString path= "resume.json";
};
}
#endif // DATAJSON_H
