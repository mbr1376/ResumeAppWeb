import QtQuick 6.2
import api 1.0
import QtQuick.Studio.Effects 1.0

Item {
    width: 800
    height: 600
    property string _aboutME: "text"
    Rectangle {
        id: backworker
        anchors.fill: parent
        color: "#121212"
        radius: 10
        clip: true
        Rectangle {
            anchors.fill: parent
            radius: 10
            color: "#FFFFFF"
            opacity: 0.2
        }

        ListModel {
            id:listmodel
             ListElement {
                 name: "Bill Jones"
                 icon: "image/noimage.png"
             }
             ListElement {
                 name: "Jane Doe"
                 icon: "image/noimage.png"
             }
             ListElement {
                 name: "John Smith"
                 icon: "image/noimage.png"
             }
             ListElement {
                 name: "John Smith"
                 icon: "image/noimage.png"
             }
             ListElement {
                 name: "John Smith"
                 icon: "image/noimage.png"
             }
             ListElement {
                 name: "John Smith"
                 icon: "image/noimage.png"
             }
             ListElement {
                 name: "John Smith"
                 icon: "image/noimage.png"
             }
             ListElement {
                 name: "John Smith"
                 icon: "image/noimage.png"
             }
         }
        Component {
                 id: delegate
                 Column {
                     id: wrapper

                     required property url icon
                     required property string name

                     opacity: PathView.isCurrentItem ? 1 : 0.1
                      z: PathView.isCurrentItem ? 1 : 0
                       ItemWorker{

                       }
                 }
             }

         PathView {
                  anchors.fill: parent
                  model: listmodel
                  clip: true
                  delegate: delegate

                  path: Path {

                      startX: backworker.width /2; startY: backworker.height /2
                      PathQuad { x: backworker.width /2; y:50 ; controlX: backworker.width -30  ; controlY: backworker.height /2}
                      PathQuad { x: backworker.width /2 ; y: backworker.height /2; controlX: 50; controlY: backworker.height/ 2 }
                  }
              }
        // JsonData{
        //     id: jsondata
        // }
        // Component.onCompleted: {
        //     jsondata.parse(":/resume.json","jobs")
        //     for (var i =0 ; i< jsondata.lenght;i++){
        //         var obj = jsondata.dataSkillList[i]
        //         listmodel.append({"image":obj.image,
        //                           "job":obj.job,
        //                           "company" : obj.company
        //                          })
        //     }
        // }
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
}
