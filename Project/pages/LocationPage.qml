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
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtPositioning 5.5
import QtLocation 5.6


Item
{
        PositionSource
        {
            active:true
            onPositionChanged:
            {
                console.log(position.coordinate)
            }
        }
        Map
        {
            id: locationPage_Map
            anchors.fill: parent
            plugin: Plugin
            {
                name: "mapbox"
                PluginParameter { name: "mapbox.access_token"; value: "pk.eyJ1IjoiaHV5bmh0aGFpaG9hIiwiYSI6ImNpdnpoN3BmNjAzYmQyem8xcTNhcWd0ZWgifQ.LIpLIt9lMU0UGM-nfaK4ww" }
                PluginParameter { name: "mapbox.map_id"; value: "huynhthaihoa.27gah0ja" }
            }
            center
            {
                latitude: -27
                longitude: 153
            }
            zoomLevel: locationPage_Map.minimumZoomLevel
            gesture.enabled: true
        }
//        MouseArea
//        {
//            onWheel:
//            {
////                if (wheel.modifiers & Qt.ControlModifier)
////                {
////                    map.zoomLevel++
////                }
//            }
//        }

}//Plugin
//{

//}
//Flickable {
//    id: flickable
//    contentHeight: pane.height
////    focus:true
////    Keys.onReleased:
////    {
////        if(event.key === Qt.Key_Back)
////        {
////            event.accepted = true;
////            mainPage_iIndex = 0;
////            mainPage_Label.text = "Home"
////            mainPage_StackView.pop();
////        }
////    }
//    readonly property int itemWidth: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 2, pane.availableWidth / 3))

//    Pane {
//        id: pane
//        width: parent.width

//        Column {
//            id: column
//            spacing: 40
//            width: parent.width

//            Label {
//                width: parent.width
//                wrapMode: Label.Wrap
//                horizontalAlignment: Qt.AlignHCenter
//                text: "Button presents a push-button that can be pushed or clicked by the user. "
//                    + "Buttons are normally used to perform an action, or to answer a question."
//            }

//            Column {
//                spacing: 20
//                anchors.horizontalCenter: parent.horizontalCenter

//                Button {
//                    text: "First_4"
//                    width: itemWidth
//                }
//                Button {
//                    id: button
//                    text: "Second_4"
//                    width: itemWidth
//                    highlighted: true
//                }
//                Button {
//                    text: "Third_4"
//                    enabled: false
//                    width: itemWidth
//                }
//            }
//        }
//    }

//    ScrollIndicator.vertical: ScrollIndicator { }
//}
