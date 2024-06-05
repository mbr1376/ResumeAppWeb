import QtQuick 6.2

import ResumeApp

Item {
    id: root

    property int size: 150
    property int lineWidth: 5
    property real value: 0.5

    property color primaryColor: "#29b6f6"
    property color secondaryColor: "#e0e0e0"

    property int animationDuration: 1000

    property string sourceimage: "image/person-96.png"
    width: size
    height: size
    Image {
        id:image
        anchors.centerIn: parent
        source: sourceimage
        width: 40
        height: 40
    }
    Text {

        text: parseInt(value * 100) + "%"

        anchors.top: image.bottom
        anchors.topMargin: 1
        anchors.horizontalCenter: image.horizontalCenter
        color: primaryColor
    }
    onValueChanged: {
        canvas.degree = value * 360;
    }

    Canvas {
        id: canvas

        property real degree: 0

        anchors.fill: parent
        antialiasing: true

        onDegreeChanged: {
            requestPaint();
        }

        onPaint: {
            var ctx = getContext("2d");

            var x = root.width/2;
            var y = root.height/2;

            var radius = root.size/2 - root.lineWidth
            var startAngle = (Math.PI/180) * 270;
            var fullAngle = (Math.PI/180) * (270 + 360);
            var progressAngle = (Math.PI/180) * (270 + degree);

            ctx.reset()

            ctx.lineCap = 'round';
            ctx.lineWidth = root.lineWidth;

            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, fullAngle);
            ctx.strokeStyle = root.secondaryColor;
            ctx.stroke();

            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, progressAngle);
            ctx.strokeStyle = root.primaryColor;
            ctx.stroke();
        }

        Behavior on degree {
            NumberAnimation {
                duration: root.animationDuration
            }
        }
    }
}
