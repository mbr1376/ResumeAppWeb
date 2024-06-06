import QtQuick 6.2
import ResumeApp

Item {
    width: 290
    height: 50
    property string _sourceImage: ""
    property string _compony: ""
    property string _job: ""
    Image {
        id: image
        source: _sourceImage
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        id: txtJobs
        text: _job
        font.pixelSize: 12
        font.family: Constants.boldFont.family
        color: Constants.fgColor
        anchors.top: image.top
        anchors.left: image.right
        anchors.leftMargin: 10
    }
    Text {
        text: _compony
        font.pixelSize: 10
        font.family: Constants.font.family
        color: "#AAFFFFFF"
        anchors.top: txtJobs.bottom
        anchors.topMargin: 1
        anchors.left: image.right
        anchors.leftMargin: 10
    }
}
