/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import QtQuick.Layouts 1.3
//import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
ApplicationWindow
{
    id: mainPage_ApplicationWindow
    visible: true
    width: 360
    height: 640
    title: qsTr("My ICares")
    property int mainPage_iIndex: 0
    property variant mainPage_aNameList: ["Home"]
    property bool mainPage_bIsOpenNewPage: false
    color: "limegreen"
    header: ToolBar
    {
    id:mainPage_ToolbarStart

    RowLayout
    {
        id: layout
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        spacing: 20
        anchors.fill: parent
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            ToolButton
            {
                spacing: -1
                contentItem: Image

                {
                    //anchors.centerIn : parent
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "qrc:/images/drawer.png"
                }
                onClicked: mainPage_Drawer.open()
            }

            Label
            {
                id: mainPage_Label
                text: "Trang chủ"
                rightPadding: -1
                leftPadding: -1
                topPadding: -1
                font.bold: true
                font.family: "Times New Roman"
                clip: true
                color: "black"
                font.pixelSize: 21
                elide: Text.ElideMiddle
                anchors.centerIn: parent
                //anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.fillWidth: true
                onTextChanged:
                {
                    if(mainPage_bIsOpenNewPage == true)
                    {
                        mainPage_aNameList.push(mainPage_Label.text)
                        mainPage_bIsOpenNewPage = false
                    }

                }
        }
    }

        }
    }
    Drawer
    {
        id: mainPage_Drawer

        width: Math.min(mainPage_ApplicationWindow.width, mainPage_ApplicationWindow.height) / 3 * 2
        height: mainPage_ApplicationWindow.height
        ListView
        {
            id: mainPage_ListView
            currentIndex: 0
            anchors.fill: parent
            delegate: ItemDelegate
            {
                width: parent.width
                text: model.title
                font.bold : true
                font.pixelSize : 15
                highlighted: ListView.isCurrentItem

                onClicked:
                {

                    mainPage_ListView.currentIndex = index
                    if(mainPage_ListView.currentIndex == 0)
                    {
                        mainPage_StackView.pop(null)
                        mainPage_Label.text = "Trang chủ"
                    }
                    else
                    {
                        doOpenPage(mainPage_ListView.currentIndex - 1)
                    }
                     mainPage_Drawer.close()
                }
                Keys.onReleased:
                {
                    if(event.key === Qt.Key_Back)
                    {
                        event.accepted = true
                        mainPage_iIndex = 0
                        mainPage_bIsOpenNewPage = false
                        mainPage_aNameList.pop()
                        mainPage_Label.text = mainPage_aNameList[mainPage_aNameList.length - 1]
                        mainPage_StackView.pop()
                    }
                }
            }

            model: ListModel
            {
                id:mainPage_ListModel
                ListElement {title: "Trang chủ"; source: "qrc:/MainPage.qml"}
                ListElement {title: "Tra cứu"; source: "qrc:/pages/DiseasePage.qml"}
                ListElement {title:"Tin tức"; source: "qrc:/pages/HealthNewsPage.qml"}
                ListElement {title:"Lịch"; source:"qrc:/pages/CalendarPage.qml"}
                ListElement {title:"Địa điểm"; source:"qrc:/pages/LocationPage.qml"}
            }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
    StackView
    {
    id: mainPage_StackView
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    focus: true
        Keys.onReleased:
        {
            if(event.key === Qt.Key_Back)
            {
                event.accepted = true
                mainPage_iIndex = 0
                mainPage_bIsOpenNewPage = false
                mainPage_aNameList.pop()
                mainPage_Label.text = mainPage_aNameList[mainPage_aNameList.length - 1]
                mainPage_StackView.pop()
            }
        }
        initialItem: Pane {
            id: mainPage_Pane
        Image {
            id: logo
            width: parent.width
            height: parent.height / 3
            source: "qrc:/images/2-Eyecare-Logo.jpg"
        }
        Row
        {
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            spacing: 20
            anchors.fill: parent

                Button
                {
                    id: mainPage_DiseaseButton
                    y : parent.height/3
                     width: parent.width / 5
                     height: parent.height / 8
                    //spacing: 20

                anchors.leftMargin: 40

                background : Rectangle {
                    //width: parent.width
                    anchors.fill : parent
                    color: "white"
                    radius: 10

                    //border.color: "#dfdfdf"
                    Image {
                        anchors.top: parent.top
                        id: tracuu
                        source: "images/index.png"
                        BorderImage {
                            id: xx
                            source: "images/search.png"
                            width: parent.width; height: parent.height
                        }
                    }
                    Text {
                            anchors.bottom: parent.bottom
                            //anchors.centerIn: parent.Center
                            text: "Tra cứu"
                            color: "black"
                            font.family: "Arial"
                            font.bold: true
                            font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter

                        }
                    }

                onClicked:
                    {
                        doOpenPage(0)
                    }
                }
                Button
                {
                    id:mainPage_HealthNewsButton
                     y : parent.height/3
                    height: parent.height / 8

                background : Rectangle {
                    //width: parent.width
                    anchors.fill : parent
                    color: "white"
                    radius: 10

                    //border.color: "#dfdfdf"
                    Image {
                        anchors.top: parent.top
                        id: tintuc
                        source: "images/index.png"
                        BorderImage {
                            id: xxx
                            source: "images/news.png"
                            width: parent.width; height: parent.height
                        }
                    }
                    Text {
                            anchors.bottom: parent.bottom
                            //anchors.centerIn: parent.Center
                            text: "Tin tức"
                            color: "black"
                            font.family: "Arial"
                            font.bold: true
                            font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter

                        }
                    }

                width: parent.width / 5
            highlighted: false
            onClicked:
                    {
                        doOpenPage(1)
                    }
                }
                Button
                {
                    id:mainPage_CalendarButton
                    y : parent.height/3
                    height: parent.height / 8


                background : Rectangle {
                    //width: parent.width
                    anchors.fill : parent
                    color: "white"
                    radius: 10

                    //border.color: "#dfdfdf"
                    Image {
                        anchors.top: parent.top
                        id: lich
                        source: "images/calenar.png"
                        BorderImage {
                            id: xxxx
                            width: parent.width; height: parent.height
                        }
                    }
                    Text {
                            anchors.bottom: parent.bottom
                            text: "    Lịch"
                            color: "black"
                            font.family: "Arial"
                            font.bold: true
                            font.pixelSize: 15
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter

                        }
                    }

                width: parent.width / 5
            onClicked:
                    {
                        doOpenPage(2)
                    }
                }
                Button
                {
                    id:mainPage_LocationButton
                    y : parent.height/3
                    height: parent.height / 8

                background : Rectangle {
                    //width: parent.width
                    anchors.fill : parent
                    color: "white"
                    radius: 10

                    //border.color: "#dfdfdf"
                    Image {
                        anchors.top: parent.top
                        id: diadiem
                        source: "images/map.png"
                        BorderImage {
                            id: x

                            width: parent.width; height: parent.height
                        }
                    }
                    Text {
                            anchors.bottom: parent.bottom
                            //anchors.centerIn: parent.Center
                            text: "Địa điểm"
                            color: "black"
                            font.family: "Arial"
                            font.bold: true
                            font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter

                        }
                    }

                    width: parent.width / 5
            highlighted: false
                onClicked:
                {
                    doOpenPage(3)
                }
            }
        }
        Label{
            font.pixelSize: 15
            font.bold: true
            color: "#8B161C"
            Label{
                anchors.bottom:  parent.bottom
                text: "Sản phẩm của Group03 UIT"
                font.underline: true
                font.bold: true
                color: "#BB0B3A"
            }
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }

        //            Image
//            {
//                id: mainPage_ArrowImage
//            source: "qrc:/images/arrow.png"

//            //anchors.left: parent.left
//            anchors.bottom: parent.bottom

//        }
    }
}
    function doOpenPage(the_index)
    {
        mainPage_bIsOpenNewPage = true
        if(the_index === 0)
            mainPage_Label.text = "Tra cứu"
        mainPage_iIndex = the_index
        mainPage_StackView.push("qrc:/pages/TabPage.qml")
    }
}
