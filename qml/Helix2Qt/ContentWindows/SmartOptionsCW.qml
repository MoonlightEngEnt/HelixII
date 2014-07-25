import QtQuick 2.0
import QtQuick.Controls 1.0


Rectangle {

    ListModel{
        id:libraryModel
        ListElement {alarmName: "Soldout-Caramel" ; state: "Alarm"; date:"03/21/14"; time:"02:00PM"; module:"System"; type:""}
        ListElement {alarmName: "Soldout-Caramel" ; state: "Alarm"; date:"03/21/14"; time:"02:00PM"; module:"System"; type:""}
        ListElement {alarmName: "Soldout-Caramel" ; state: "Alarm"; date:"03/21/14"; time:"02:00PM"; module:"System"; type:""}


    }
    TableView{
        TableViewColumn{role: "alarmName"; title:"ALARM NAME"; width: 150}
        TableViewColumn{role: "state"; title:"STATE"; width: 100}
        TableViewColumn{role: "date"; title:"DATE"; width: 100}
        TableViewColumn{role: "time"; title:"TIME"; width: 100}
        TableViewColumn{role: "module"; title:"MODULE"; width: 100}
        TableViewColumn{role: "System"; title:"SYSTEM"; width: 100}
        itemDelegate: Item{

         Text{
             anchors.verticalCenter: parent.verticalCenter
             color:'red'
             text: styleData.value

         }
        }
    }

}
