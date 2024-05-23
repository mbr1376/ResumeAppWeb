#include "datajson.h"
#include "qdir.h"

#include <QFileInfo>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
using namespace JSON;
DataJson::DataJson(QObject *parent)
    : QObject{parent}
{}

bool DataJson::fileExists(QString path)
{
    QFileInfo check_file (path);
    if (check_file.exists() && check_file.isFile()){
        return true;
    }
    else{
        return false;
    }

}

QVariantList DataJson::dataSkillList() const
{
    return m_dataSkillList;
}

int DataJson::lenght() const
{
    return m_lenght;
}

void DataJson::parse(QString nameModel)
{
    QString rawData;
    QVariantList finalJson;
    QFile file(":/resume.json");

    qDebug()<< file.exists();

   //  if(fileExists(this->path)){
   //      {
   //          file.setFileName(this->path);
   //          file.open(QIODevice::ReadOnly | QIODevice::Text);

   //          //Load data from json file!
   //          rawData = file.readAll();

   //          file.close();



   //          QJsonDocument document   =   { QJsonDocument::fromJson(rawData.toUtf8()) };

   //          //Create data as Json object
   //          QJsonObject jsonObject = document.object();

   //          // Sets number of items in the list as integer.

   //          setLenght(jsonObject[nameModel].toArray().count());

   //          finalJson = json2Variant(jsonObject[nameModel].toArray(), nameModel);
   //      }
   //      setDataSkillList(finalJson);
   //  }else
   //      qWarning() << "There is no any file in this path";
}

void DataJson::setDataSkillList(const QVariantList &data)
{
    if(m_dataSkillList == data)
        return;
    m_dataSkillList =  data;
    emit dataSkillListChanged(m_dataSkillList);
}

void DataJson::setLenght(int value)
{
    if (m_lenght == value)
        return;
    m_lenght =  value;
    emit lenghtChanged(m_lenght);
}

QVariantList DataJson::json2Variant(QJsonArray array, QString nameModel)
{
    QVariantMap modelData;
    QVariantList finalJson;
    if (nameModel == "skills"){
        foreach (const QJsonValue &value, array) {

            // Sets value from model as Json object
            QJsonObject modelObject = value.toObject();

            modelData.insert("id", modelObject["id"].toInt());
            modelData.insert("name", modelObject["name"].toString());
            modelData.insert("value", modelObject["value"].toInt());
            modelData.insert("image",modelObject["image"].toString());

            // Set model data
            finalJson.append(modelData);
        }
    }
    return finalJson;
}
