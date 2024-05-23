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
    // Information{
    //     id:information
    //     anchors.left: backgrand.left
    //     anchors.right: backgrand.right
    //     anchors.top: backgrand.top
    //     anchors.leftMargin: 30
    //     anchors.rightMargin: 30
    //     anchors.topMargin: 25


    // }



}

