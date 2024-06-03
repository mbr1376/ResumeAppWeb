import QtQuick 6.2
import api 1.0
import QtQuick.Studio.Effects 1.0

Item {
    width: 800
    height: 600
    property string _aboutME: "text"
    property int itemAngle: 60
    property int itemSize: 400
    Rectangle {
    id:backworker
    anchors.fill: parent
    color: "#121212"
    radius: 10

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: "#FFFFFF"
        opacity: 0.2
    }
        ListModel {
            id: dataModel



        }

        PathView {
            id: view
            clip: true
            anchors.fill: parent
            model: dataModel
            pathItemCount: 6

            path: Path {
                startX: 0
                startY: height / 2

                PathPercent { value: 0.0 }
                PathAttribute { name: "z"; value: 0 }
                PathAttribute { name: "angle"; value: itemAngle }
                PathAttribute { name: "origin"; value: 0 }
                PathLine {
                    x: (view.width - itemSize) / 2
                    y: view.height / 2
                }
                PathAttribute { name: "angle"; value: itemAngle }
                PathAttribute { name: "origin"; value: 0 }
                PathPercent { value: 0.49 }
                PathAttribute { name: "z"; value: 10 }


                PathLine { relativeX: 0; relativeY: 0 }

                PathAttribute { name: "angle"; value: 0 }
                PathLine {
                    x: (view.width - itemSize) / 2 + itemSize
                    y: view.height / 2
                }
                PathAttribute { name: "angle"; value: 0 }
                PathPercent { value: 0.51 }

                PathLine { relativeX: 0; relativeY: 0 }

                PathAttribute { name: "z"; value: 10 }
                PathAttribute { name: "angle"; value: -itemAngle }
                PathAttribute { name: "origin"; value: itemSize }
                PathLine {
                    x: view.width
                   y : view.height / 2
                }
                PathPercent { value: 1 }
                PathAttribute { name: "z"; value: 0 }
                PathAttribute { name: "angle"; value: -itemAngle }
                PathAttribute { name: "origin"; value: itemSize }
            }
            delegate:ItemWorker{
                width: itemSize
                height: width
                z: PathView.z
                rotationAngle: PathView.angle
                rotationOrigin: PathView.origin
                _date: date
                _abstract : abstrac
                _titel : titel
                _link : linksource
                _employer :the_employer


            }
        }
    }
    DropShadowEffect {
        source: backworker
        anchors.fill: backworker
        horizontalOffset: 1
        verticalOffset: 1
        radius: 8
        samples: 17
        color: "#aaFFFFFF"
        spread: 0
    }
    JsonData{
        id:jsonData
    }
    Component.onCompleted: {
        jsonData.parse(":/resume.json","projects")
        for (var i=0; i<jsonData.lenght;i++){
            var obj = jsonData.dataSkillList[i]
            dataModel.append({"titel":obj.titel ,
                              "date": obj.date,
                              "the_employer" :  obj.the_employer ,
                              "abstrac" : obj.abstract ,
                              "linksource" : obj.link

                             })

        }
    }
}
