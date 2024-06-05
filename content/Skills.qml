import QtQuick 6.2
import api 1.0
import QtQuick.Studio.Effects 1.0
import QtQuick.Controls
import ResumeApp

Item {
    id: secenf
    Rectangle {
        id: backSkill
        anchors.fill: parent
        color: Constants.backgroundColor
        radius: 10

        Rectangle {
            anchors.fill: parent
            radius: 10
            color: Constants.fgColor
            opacity: 0.2

        }
        ListView {
            id: listView
            spacing: 5
            anchors.fill: backSkill
            anchors.margins: 5
            clip: true
            anchors.horizontalCenter: parent.horizontalCenter

            model: ListModel{
                id:listModel

            }

            delegate: ItemSkill{
                lineWidth: 4
                size: 120
                secondaryColor: "#e0e0e0"
                primaryColor: "#03DAC6"
                value: valuel
                sourceimage: image
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
    DropShadowEffect{
        anchors.fill: backSkill
        source: backSkill
        horizontalOffset: 2
        verticalOffset: 1
        radius: 8
        samples: 17
        color: "#aaffffff"
        spread: 0
    }

    JsonData{
        id:jsonData
    }
    Component.onCompleted: {
        jsonData.parse(":/resume.json","skills")
        for (var i=0; i<jsonData.lenght;i++){
            var obj = jsonData.dataSkillList[i]
            listModel.append({"name":obj.name ,
                              "id": obj.id,
                              "valuel" :  obj.value ,
                              "image" : obj.image

                             })

        }
    }

}
