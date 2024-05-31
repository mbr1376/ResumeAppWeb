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

void DataJson::parse(QString path,QString nameModel)
{
    QString rawData;
    QVariantList finalJson;
    QFile file(path);

     if(fileExists(path)){
        {
            file.setFileName(path);
            file.open(QIODevice::ReadOnly | QIODevice::Text);
             //Load data from json file!
             rawData = file.readAll();
             file.close();
             QJsonDocument document   =   { QJsonDocument::fromJson(rawData.toUtf8()) };

   //          //Create data as Json object
             QJsonObject jsonObject = document.object();

   //          // Sets number of items in the list as integer.

             setLenght(jsonObject[nameModel].toArray().count());

            finalJson = json2Variant(jsonObject[nameModel].toArray(), nameModel);
         }
         setDataSkillList(finalJson);
     }else
         qWarning() << "There is no any file in this path";
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
    if (nameModel == "about"){
        foreach (const QJsonValue &value, array) {
             // Sets value from model as Json object
            QJsonObject modelObject = value.toObject();
            // information json
            modelData =parseInformation2Variant(modelObject["information"].toArray());
            finalJson.append(modelData);

         }
    }
    else if (nameModel =="socialNetwork"){
        foreach (const QJsonValue &value, array) {
            QJsonObject modelObject =  value.toObject();
            modelData.insert("image",modelObject["image"].toString());
            modelData.insert("url",modelObject["url"].toString());
            finalJson.append(modelData);
        }
    }
    else if (nameModel == "skills"){
        foreach (const QJsonValue &value, array) {
            QJsonObject  modelObject = value.toObject();
            modelData.insert("id", modelObject["id"].toInt());
            modelData.insert("nameSkill", modelObject["name"].toString());
            modelData.insert("value", modelObject["value"].toDouble());
            modelData.insert("image", modelObject["image"].toString());
            finalJson.append(modelData);
        }
    }
    else if (nameModel == "education"){
        foreach (const QJsonValue &value, array) {
            QJsonObject  modelObject = value.toObject();
            modelData.insert("education", modelObject["education"].toString());
            modelData.insert("univesity", modelObject["univesity"].toString());
            modelData.insert("Orientation", modelObject["Orientation"].toString());
            modelData.insert("image", modelObject["image"].toString());
            finalJson.append(modelData);
        }

    }
    else if (nameModel == "jobs"){
        foreach (const QJsonValue &value, array) {
            QJsonObject  modelObject = value.toObject();
            modelData.insert("job", modelObject["job"].toString());
            modelData.insert("company", modelObject["company"].toString());
            modelData.insert("image", modelObject["image"].toString());
            finalJson.append(modelData);
        }

    }
    return finalJson;
}

QVariantMap DataJson::parseInformation2Variant(QJsonArray array)
{
    QVariantMap modelData;
    foreach (const QJsonValue &value, array) {
        qDebug() << "mbr";
        QJsonObject modelObject = value.toObject();
            modelData.insert("name", modelObject["name"].toString());
            modelData.insert("family", modelObject["family"].toString());
            modelData.insert("age", modelObject["age"].toString());
            modelData.insert("email",modelObject["email"].toString());
            modelData.insert("titel",modelObject["titel"].toString());
            modelData.insert("location",modelObject["location"].toString());
            modelData.insert("phone",modelObject["phone"].toString());
            modelData.insert("about",modelObject["about"].toString());
    }
    return modelData;
}
