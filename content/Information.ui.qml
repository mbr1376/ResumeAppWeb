import QtQuick 6.2
import QtQuick.Layouts
import ResumeApp

Rectangle {
    property string _name: "MohamadBagher"
    property string _Family: "Roodsarabi"
    property string _age: "26"
    property string _email: "mbroodsaraby76@gmail.com"
    property string _location: "Tehran"
    property string _phone: "09398831591"
    property string _titel: "Developer"
    width: 800
    height: 80
    color: Constants.backgroundColor
    radius: 10
    Rectangle {
        anchors.fill: parent
        color: Constants.fgColor
        opacity: 0.2
        radius: 10
        border.color: "#000000"
        border.width: 1
    }
    RowLayout {
        id: row
        anchors.fill: parent
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        spacing: 5
        Image {
            id: person
            source: "image/person.png"
            Layout.minimumWidth: 45
            Layout.minimumHeight: 45
        }
        Text {
            id: nameFamily
            color: Constants.fgColor
            text: "Name: " + _name + "\n" + "Family: " + _Family + "\nAge: " + _age
            font.pixelSize: 13
            font.family: Constants.font.family

        }

            Text {
                anchors.centerIn: parent.Center
                id: titel
                text: _titel
                color: Constants.fgColor
                font.pixelSize: Constants.boldFont.pixelSize
                font.family: Constants.boldFont.family
            }

        ColumnLayout {
            id: columnLayout
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 10
            Layout.alignment: Qt.AlignVCenter
            width: 200
            RowLayout {
                Layout.fillWidth: true
                Image {
                    id: email
                    sourceSize.width: 15
                    sourceSize.height: 15
                    source: "image/email.png"
                }
                Text {
                    color: Constants.fgColor
                    text: _email
                    font.pixelSize: 12
                    font.family: Constants.font.family
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Image {
                    id: phone
                    sourceSize.width: 15
                    sourceSize.height: 15
                    source: "image/phone.png"
                }
                Text {
                    color: Constants.fgColor
                    text: _phone
                    font.pixelSize: 12
                    font.family: Constants.font.family
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Image {
                    id: location
                    sourceSize.width: 15
                    sourceSize.height: 15
                    source: "image/location.png"
                }
                Text {
                    color: Constants.fgColor
                    text: _location
                    font.pixelSize: 12
                    font.family: Constants.font.family
                }
            }
        }
    }
}
