import QtQuick 6.2
import api 1.0
import QtQuick.Studio.Effects 1.0
import QtQuick.Controls
Item {
    id: secenf
    Rectangle {
        id: backSkill
        anchors.fill: parent
        color: "#121212"
        radius: 10

        Rectangle {
            anchors.fill: parent
            radius: 10
            color: "#FFFFFF"
            opacity: 0.2

        }
        ListView {
            id: listView
            spacing: 5
            anchors.fill: backSkill
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter

            model: ListModel{
                id:listModel
                ListElement{
                    valuel: 1.0
                }
                ListElement{
                    valuel:0.3
                }
            }

            delegate: ItemSkill{
                lineWidth: 3
                size: 120
                secondaryColor: "#e0e0e0"
                primaryColor: "#03DAC6"
                value: valuel
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

    // JsonData{
    //     id:jsonData
    // }
    // Component.onCompleted: {
    //     jsonData.parse("skills")
    //     for (var i=0; i<jsonData.lenght;i++){
    //         var obj = jsonData.dataSkillList[i]
    //         listModel.append({"name":obj.name})
    //     }
    // }

}
