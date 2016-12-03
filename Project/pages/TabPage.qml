import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

TabView {
    id:tabPage
  //  anchors.fill:parent
  //  anchors.margins: 3
    Component.onCompleted:
    {
        insertTab("Tab 1",mainPage_ListModel.get(4).title, Qt.createComponent("LocationPage.qml"))

        insertTab("Tab 2",mainPage_ListModel.get(3).title, Qt.createComponent("CalendarPage.qml"))

        insertTab("Tab 3",mainPage_ListModel.get(2).title, Qt.createComponent("HealthNewsPage.qml"))

        insertTab("Tab 4",mainPage_ListModel.get(1).title, Qt.createComponent("DiseasePage.qml"))
    }
    currentIndex: mainPage_iIndex
    style: TabViewStyle {

           frameOverlap: 1
           tab: Rectangle {
               color: styleData.selected ? "#34CC19" :"limegreen"
               border.color:  "limegreen"
               implicitWidth: tabPage.width / 4
               implicitHeight: 40
               radius: 2
               Text {
                   id: mytext
                   anchors.centerIn: parent
                   text: styleData.title
                   color: styleData.selected ? "white" : "black"
               }
           }
           frame: Rectangle { color: "limegreen" }
       }
    onCurrentIndexChanged:
    {
        mainPage_Label.text = mainPage_ListModel.get(currentIndex + 1).title
    }
}
