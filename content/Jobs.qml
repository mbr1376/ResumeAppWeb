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
            orientation: Qt.Horizontal
            layoutDirection: Qt.LeftToRight
            anchors.verticalCenter: parent.verticalCenter
            spacing: 5
            model:ListModel{
                id:listmodel
            }
            delegate: ItemEducation{
                anchors.verticalCenter: parent.verticalCenter
                _txtL :   education
                _txtM : univesity
                _txtS : Orientation
                _sourceImage : image
            }
        }
        JsonData{
            id: jsondata
        }
        Component.onCompleted: {
            jsondata.parse(":/resume.json","education")
            for (var i =0 ; i< jsondata.lenght;i++){
                var obj = jsondata.dataSkillList[i]
                listmodel.append({"image":obj.image,
                                  "education":obj.education,
                                  "univesity" : obj.univesity,
                                  "Orientation" :  obj.Orientation
                                 })
            }
        }
    }

}
