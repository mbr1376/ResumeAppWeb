// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import ResumeApp
import api 1.0
Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "ResumeApp"

    ScreenBack{
        id:backgrand
        anchors.fill: parent
    }
    Information{
        id:information
        anchors.left: backgrand.left
        anchors.right: skill.left
        anchors.top: backgrand.top
        anchors.leftMargin: 30
        anchors.rightMargin: 5
        anchors.topMargin: 25

    }
    About{
        id:about
        anchors.top: information.bottom
        anchors.topMargin: 5
        anchors.left: backgrand.left
        anchors.leftMargin: 30
        height: parent.height / 2
    }

   Skills{
       id :skill
       anchors.right: parent.right
       anchors.rightMargin: 30
       anchors.top: parent.top
       anchors.topMargin: 25
       anchors.bottom: parent.bottom
       anchors.bottomMargin: 5
       width: 150
       height: parent.width - 30
   }
   Link{
       id: link
       anchors.left: backgrand.left
       anchors.leftMargin: 30
       height: parent.height / 3.5
       anchors.top: about.bottom
       anchors.topMargin: 10
   }
   Education{
       id: education
       anchors.top: information.bottom
       anchors.topMargin: 4
       anchors.left: about.right
       anchors.leftMargin: 5
       anchors.right: jobs.left
       anchors.rightMargin: 2.5

   }
   Jobs{
       id:jobs
       anchors.top: information.bottom
       anchors.topMargin: 4
       anchors.right: skill.left
       anchors.rightMargin: 5
   }
    SlideShow{
        anchors.top: jobs.bottom
        anchors.topMargin: 10
        anchors.left: about.right
        anchors.leftMargin: 10
        anchors.right: skill.left
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

    }

   JsonData{
       id:jsonData
   }
   Component.onCompleted: {
       jsonData.parse(":/resume.json","about")
        for (var i=0; i<jsonData.lenght;i++){
           var obj = jsonData.dataSkillList[i]
           information._Family = obj.family
           information._name = obj.name
           information._age = obj.age
           information._titel = obj.titel
           information._email = obj.email
           information._location = obj.location
           information._phone  =  obj.phone
           about._aboutME = obj.about

       }
   }
}

