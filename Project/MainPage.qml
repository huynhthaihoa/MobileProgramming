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

import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
//import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0

ApplicationWindow
{
    id: mainPage_ApplicationWindow
    visible: true
    width: 360
    height: 520
    title: qsTr("My ICares")
  //  property int mainPage_iIndex: 0
    property variant mainPage_aNameList: ["Home"]
    property bool mainPage_bIsOpenNewPage: false
    header: ToolBar
    {
        id:mainPage_ToolbarStart
        RowLayout
        {
            spacing: 20
            anchors.fill: parent
            ToolButton
            {
                contentItem: Image
                {
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
                font.pixelSize: 20
                elide: Text.ElideMiddle
                anchors.horizontalCenter: parent.horizontalCenter
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
                    //console.log(mainPage_aNameList[mainPage_aNameList.length - 1] + ";" + mainPage_aNameList.length)
                }
            }

//            ToolButton
//            {
//                contentItem: Image
//                {
//                    fillMode: Image.Pad
//                    horizontalAlignment: Image.AlignHCenter
//                    verticalAlignment: Image.AlignVCenter
//                    source: "qrc:/images/menu.png"
//                }
//                onClicked: mainPage_Menu.open()
//                Menu
//                {
//                    id: mainPage_Menu
//                    x: parent.width - width
//                    transformOrigin: Menu.TopRight
//                    MenuItem
//                    {
//                        text: "Settings"
//                        onTriggered: settingsPopup.open()
//                    }
//                    MenuItem
//                    {
//                        text: "About"
//                        onTriggered: aboutDialog.open()
//                    }
//                }
//            }

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
                highlighted: ListView.isCurrentItem
                onClicked:
                {
                    mainPage_ListView.currentIndex = index
                    if(mainPage_ListView.currentIndex == 0)
                    {
                        mainPage_Label.text = "Home"
                        mainPage_StackView.push("qrc:/MainPage.qml")
                    }
                    doOpenPage(mainPage_ListView.currentIndex - 1)
                     mainPage_Drawer.close()
                }
                Keys.onReleased:
                {
                    if(event.key === Qt.Key_Back)
                    {
                        event.accepted = true
        //                mainPage_iIndex = 0
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
                ListElement {title: "Home"; source: "qrc:/MainPage.qml"}
                ListElement {title: "Diseases"; source: "qrc:/pages/DiseasePage.qml"}
                ListElement {title:"Health News"; source: "qrc:/pages/HealthNewsPage.qml"}
                ListElement {title:"Calendar"; source:"qrc:/pages/CalendarPage.qml"}
                ListElement {title:"Location"; source:"qrc:/pages/LocationPage.qml"}
            }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
    StackView
    {
        id: mainPage_StackView
        anchors.fill: parent
        Keys.onReleased:
        {
            if(event.key === Qt.Key_Back)
            {
                event.accepted = true
//                mainPage_iIndex = 0
                mainPage_bIsOpenNewPage = false
                mainPage_aNameList.pop()
                mainPage_Label.text = mainPage_aNameList[mainPage_aNameList.length - 1]
                mainPage_StackView.pop()
            }
        }
        initialItem: Pane {
            id: mainPage_Pane

            Image {
                id: mainPage_LogoImage
                width: mainPage_Pane.availableWidth / 2
                height: mainPage_Pane.availableHeight / 2
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -50
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/qt-logo.png"
            }

            Label {
                text: "Nhấn nút để chuyển đến trang tương ứng"
            anchors.margins: 20
            anchors.top: mainPage_LogoImage.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: mainPage_ArrowImage.top
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                wrapMode: Label.Wrap
            }
            Row
            {
                anchors.fill: parent
                Button
                {
                    id: mainPage_DiseaseButton
                    text: "Bệnh"
                width: parent.width / 4
                onClicked:
                    {
                        doOpenPage(0)
                    }
                }
                Button
                {
                    id:mainPage_HealthNewsButton
                    text: "Tin tức"
                width: parent.width / 4
                onClicked:
                    {
                        doOpenPage(1)
                    }
                }
                Button
                {
                    id:mainPage_CalendarButton
                    text: "Lịch"
                width: parent.width / 4
                onClicked:
                    {
                        doOpenPage(2)
                    }
                }
                Button
                {
                    id:mainPage_LocationButton
                    text: "Địa điểm"
                    width: parent.width / 4
                    onClicked:
                    {
                        doOpenPage(3)
                    }
                }
            }

            Image
            {
                id: mainPage_ArrowImage
                source: "qrc:/images/arrow.png"
                anchors.bottom: parent.bottom
            }
        }
    }
    function doOpenPage(the_index)
    {
        mainPage_bIsOpenNewPage = true
        if(the_index === 0)
            mainPage_Label.text = "Diseases"
        //mainPage_iIndex = the_index
        mainPage_StackView.push("qrc:/pages/TabPage.qml")
    }
}
