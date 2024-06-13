import QtQuick 6.2
import QtQuick.Controls
import api 1.0
import QtQuick.Studio.Effects 1.0
import ResumeApp
Item {
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
        SwipeView{
            id:slider
            anchors.fill: parent
            anchors.margins: 30
            x:(parent.width-width)/2//make item horizontally center
            property var model :ListModel{}
            clip:true
            Repeater {
                model:slider.model
                Image{
                    width: slider.width
                    height: slider.height
                    source:image
                    fillMode: Image.Stretch
                }
            }
        }
        PageIndicator {
            anchors.bottom: slider.bottom
            anchors.bottomMargin: 15
            anchors.right: slider.right
            anchors.rightMargin: 10
            currentIndex: slider.currentIndex
            count: slider.count
            delegate: Rectangle {
                implicitWidth: 40
                implicitHeight: 5

                radius: width
                color: Constants.error

                opacity: index === slider.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                Behavior on opacity {
                    OpacityAnimator {
                        duration: 100
                    }
                }
            }
        }
        JsonData{
            id:jsonData
        }

        Component.onCompleted: {
            jsonData.parse(":/resume.json","Evidence")
            for (var i=0; i<jsonData.lenght;i++){
                var obj = jsonData.dataSkillList[i]
                slider.model.append({"image" : obj.image})
                console.log(obj.image)

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
}
