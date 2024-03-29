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


    Slide{
        id:slide
        anchors.left: parent.left
        width: parent.width/8
        height: parent.height
    }
    Frame{
        id:frame
        anchors.left: slide.right
        anchors.leftMargin: 20
        width: parent.width - slide.width - 10
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        //height: parent.height

    }
    Connections{
        target: slide
        onAboutClicked: frame.currentframe =0
        onSkillClicked: frame.currentframe = 1
        onWorkerClicked: frame.currentframe = 2
    }
    JsonData{

    }

}

