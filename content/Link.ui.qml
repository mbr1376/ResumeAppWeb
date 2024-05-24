import QtQuick 6.2
import QtQuick.Studio.Effects 1.0

Item {
    width: 300
    height: 200
    id:root
    Rectangle {
        id: backlink
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
            clip: true
            anchors.fill: parent
            anchors.margins: 5
            contentHeight:300
            model:ListModel{
                ListElement{
                    sourceImage: "image/phone.png"
                    textLink: "dagergrg"
                }
                ListElement{
                    sourceImage : "image/phone.png"
                    textLink : "ertetetet"
                }
            }

            delegate: Item {
                width: backlink .width
                height: 30
                     Image {
                         id:image
                         width: 30
                         height: 30
                         source: sourceImage
                    }
                     Text {
                         anchors.left: image.right
                         anchors.leftMargin: 5
                         text: textLink
                         width: parent.width
                         height: 30
                         color: "#aaFFFFFF"
                         anchors.verticalCenter: image.verticalCenter
                    }

            }

        }
    }
    DropShadowEffect {
        source: backlink
        anchors.fill: backlink
        horizontalOffset: 1
        verticalOffset: 1
        radius: 8
        samples: 17
        color: "#aaFFFFFF"
        spread: 0
    }
}
