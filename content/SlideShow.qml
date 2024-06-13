import QtQuick 6.2
import ResumeApp
import QtQuick.Controls
Item {
    width: 800
    height: 600
    clip: true
    SwipeView {
        clip: true
        id:view
        anchors.fill: parent
        currentIndex: 1

        Worker{
            //anchors.fill: parent
        }
        Evidence{

        }


    }
    PageIndicator {
         id: indicator

         count: view.count
         currentIndex: view.currentIndex
         interactive: true
         anchors.bottom: view.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         delegate:  Rectangle {
             implicitWidth: 10
             implicitHeight: 10

             radius: width
             color: Constants.error

             opacity: index === view.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

             Behavior on opacity {
                 OpacityAnimator {
                     duration: 100
                 }
             }
         }
     }


}
