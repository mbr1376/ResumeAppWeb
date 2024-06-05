import QtQuick 6.2
import QtQuick.Studio.Effects 1.0
import ResumeApp

Item {
    width: 300
    height: 400
    property string _aboutME: "text"


    Rectangle {
        id: backAbout
        anchors.fill: parent
        color: Constants.backgroundColor
        radius: 10

        Rectangle {
            anchors.fill: parent
            radius: 10
            color: Constants.fgColor
            opacity: 0.2
        }
        Image {
            id: image
            source: "image/person-96.png"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Rectangle {
            id: rectangle
            anchors.top: image.bottom
            anchors.topMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 15
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            radius: 5
            color: "#1f1b24"
            Text {
                anchors.fill: parent
                anchors.margins: 7
                text: _aboutME
                color: Constants.fgColor
                wrapMode: Text.WordWrap
                font.pointSize: 12
                clip: true
                elide: Text .ElideLeft
            }
        }
    }
    DropShadowEffect {
        source: backAbout
        anchors.fill: backAbout
        horizontalOffset: 1
        verticalOffset: 1
        radius: 8
        samples: 17
        color: "#aaFFFFFF"
        spread: 0
    }
}
