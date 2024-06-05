import QtQuick 6.2
import ResumeApp

Item {

    Rectangle {
        id: back
        anchors.fill: parent
        color: Constants.backgroundColor

        // SequentialAnimation{
        //     loops: Animation.Infinite
        //     running: true
        //     PropertyAnimation{
        //         target: back
        //         property: "color"
        //         from: Constants.backgroundColor
        //         to: "#CC121212"
        //         duration: 10000
        //     }
        //     PropertyAnimation{
        //         target: back
        //         property: "color"
        //         from:"#CC121212"
        //         to: Constants.backgroundColor
        //         duration: 10000
        //     }
        // }

    }

}
