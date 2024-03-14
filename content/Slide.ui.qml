import QtQuick 6.2
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    signal aboutClicked();
    signal skillClicked();
    signal workerClicked();
    id: slide
    width: 500
    height: 700

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        ColumnLayout {
            id: columnLayout
            anchors.fill: parent
            anchors.topMargin: 50
            anchors.bottomMargin: 50

            ButtinItem {
                id: buttinItem
                width: 150 //columnLayout.width / 2
                height: 150 //columnLayout.height / 4
                anchors.horizontalCenter: parent.horizontalCenter
                name: "About"

                Connections {
                    target: buttinItem
                    onClick: aboutClicked()
                }
            }

            ButtinItem {
                id: buttinItem1
                width: 150 //parent.width / 2
                height: 150 //parent.height / 4
                anchors.horizontalCenter: parent.horizontalCenter
                name: "Skill"
                Connections {
                    target: buttinItem1
                    onClick: skillClicked()
                }
            }
            ButtinItem {
                id: buttinItem2
                width: 150 //parent.width / 2
                height: 150 // parent.height / 4
                anchors.horizontalCenter: parent.horizontalCenter
                name: "Worker"
                Connections {
                    target: buttinItem2
                    onClick: workerClicked()
                }
            }
        }
    }
}
