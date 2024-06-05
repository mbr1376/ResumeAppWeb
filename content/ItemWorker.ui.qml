import QtQuick 6.2
import QtQuick.Studio.Effects 1.0
import ResumeApp

Item {
    width: 600
    height: 400
    property real rotationAngle: 0.0
    property real rotationOrigin: 0.0
    property string _titel: "project"
    property string _date: "1398"
    property string _abstract: ""
    property string _employer: ""
    property string _link: "https://www.google.com"

    Rectangle {
        id: back
        anchors.fill: parent
        color: Constants.primery
        border.width: 2
        border.color: Constants.backgroundColor
        radius: 10
        transform: Rotation {
            axis {
                x: 0
                y: 1
                z: 0
            }
            angle: rotationAngle
            origin.x: rotationOrigin
        }
        Text {
            id: titel
            text: _titel
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.pointSize: 14
        }
        Text {
            id: dat
            text: "Date :   " + _date
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: titel.bottom
            anchors.topMargin: 10
            wrapMode: Text.WordWrap
            clip: true
        }
        Text {
            id: the_employer
            text: "Employer :" + _employer
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: dat.bottom
            anchors.topMargin: 10
            wrapMode: Text.WordWrap
            clip: true
        }
        TextEdit {
            id: abst
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: the_employer.bottom
            anchors.topMargin: 20
            readOnly: true
            text: _abstract
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            wrapMode: Text.WordWrap
            clip: true
        }
        Text {
            id: link_Text
            text: "Link: " + '<html><style type="text/css"></style><a href='
                  + _link + 'google</a></html>'
            // onLinkActivated: Qt.openUrlExternally(link)
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 5

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                acceptedButtons: Qt.NoButton // Don't eat the mouse clicks
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
    MouseArea {
        anchors.fill: parent
    }
}
