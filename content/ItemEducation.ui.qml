import QtQuick 6.2
import QtQuick.Studio.Effects 1.0

Item {
    height: 90
    width: 400
    property string _sourceImage: ""
    property string _txtL: ""
    property string _txtM: ""
    property string _txtS: ""
    Rectangle {
        id: back
        anchors.fill: parent
        color: "#99121212"
        border.width: 2
        border.color: "#121212"
        radius: 10
        layer.effect: ShaderEffectSource{
            anchors.fill: parent

            FastBlurEffect{
                anchors.fill: parent
                source: back
                radius: 32
            }
        }

        Rectangle{
            id: recImage
            width: 70
            height: 70
            anchors.leftMargin:5
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            radius: 100
            color: "#BB86FC"
            Image {
                anchors.centerIn: parent
                width: 50
                height: 50
                source: _sourceImage
            }

        }
        Text {
            id: txtL
            clip: true
            text: _txtL
            color: "#FFFFFF"
            font.pointSize: 12
            anchors.left: recImage.right
            anchors.leftMargin: 10
            anchors.top: recImage.top
        }
        Text {
            id: txtM
            text: _txtM
            clip: true
            color: "#AAFFFFFF"
            font.pointSize: 11
            anchors.left: recImage.right
            anchors.top: txtL.bottom
            anchors.topMargin: 5
            anchors.leftMargin: 10
        }
        Text {
            id: txtS
            text: _txtS
            clip: true
            color: "#AAFFFFFF"
            font.pointSize: 9
            anchors.left: recImage.right
            anchors.top: txtM.bottom
            anchors.topMargin: 3
            anchors.leftMargin: 10
        }
    }
}
