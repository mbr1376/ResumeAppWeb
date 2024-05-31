import QtQuick 6.2
import api 1.0
import QtQuick.Studio.Effects 1.0

Item {
    width: 300
    height: 100
    property string _aboutME: "text"
    Rectangle {
        id: backEducation
        anchors.fill: parent
        color: "#121212"
        radius: 10

        Rectangle {
            anchors.fill: parent
            radius: 10
            color: "#FFFFFF"
            opacity: 0.2
        }
        ListView{
            anchors.fill: parent
            clip: true
            anchors.margins: 5
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5
            model:ListModel{
                id:listmodel
            }
            delegate: ItemJobs{
                anchors.horizontalCenter: parent.horizontalCenter
                _sourceImage :image
                _compony: company
                _job :  job
            }

        }
        JsonData{
            id: jsondata
        }
        Component.onCompleted: {
            jsondata.parse(":/resume.json","jobs")
            for (var i =0 ; i< jsondata.lenght;i++){
                var obj = jsondata.dataSkillList[i]
                listmodel.append({"image":obj.image,
                                  "job":obj.job,
                                  "company" : obj.company
                                 })
            }
        }
    }

}
