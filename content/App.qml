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
}

