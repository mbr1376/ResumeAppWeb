import QtQuick 6.2
import ResumeApp

Item {

    Rectangle {
        id: back
        anchors.fill: parent
        color: "#121212"

        SequentialAnimation{
            loops: Animation.Infinite
            running: true
            PropertyAnimation{
                target: back
                property: "color"
                from: "#121212"
                to: "#CC121212"
                duration: 10000
            }
            PropertyAnimation{
                target: back
                property: "color"
                from:"#CC121212"
                to: "#121212"
                duration: 10000
            }
        }

    }

}
