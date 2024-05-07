import QtQuick 6.2
import api 1.0
Item {
    id: secenf
    JsonData{
        id:jsonData
    }

    ListView {
        id: listView
        width: 110
        height: 160
        model: ListModel{
            id:listModel
        }

        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                spacing: 10
                Rectangle {
                    width: 40
                    height: 40
                    color: "blue"
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
            }
        }
    }

    Component.onCompleted: {
        jsonData.parse("skills")
        for (var i=0; i<jsonData.lenght;i++){
            var obj = jsonData.dataSkillList[i]
            listModel.append({"name":obj.name})
        }
    }
}
