import QtQuick 6.2
import QtQuick.Controls 6.6
import api 1.0
Item {
    property int currentframe: 0
    Rectangle{
        anchors.fill: parent
        color: "white"
        opacity: 0.6
        radius: 20
        ShaderEffectSource{
            anchors.fill: parent
            sourceRect: parent
        }
        SwipeView {
            id :view
           anchors.fill: parent
           anchors.margins: 5
           currentIndex: currentframe
           Item {
               id: first
           }
           Skills{

           }

           Item{
               id: thread
           }

        }
    PageIndicator{
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
       delegate: Rectangle{
           implicitHeight: 15
           implicitWidth: 15
           radius: width
           color: "#21be2b"
           opacity: index === view.currentIndex ? 0.95 : pressed ?  0.7:0.45

       }
    }
    }
}
