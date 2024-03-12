import QtQuick 6.2
import QtQuick.Controls

Item {
    property string name: value
    signal click()
    Image {
        id: _image
        anchors.fill: parent
        source: "image/buttonItem.PNG"
        fillMode: Image.PreserveAspectFit
        Text {
            id: _namebutton
            text: name
            anchors.centerIn: parent
            color: "#FFFFFF"

        }
    }

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color:  "transparent"
        border.color: "transparent"
        border.width: 1
        radius: 30
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: rectangle.border.color = "#3F51B5"
        onExited: rectangle.border.color = "transparent"


    }
    Connections{
        target: mouseArea
        onClicked:{
            click();
        }
    }
}
