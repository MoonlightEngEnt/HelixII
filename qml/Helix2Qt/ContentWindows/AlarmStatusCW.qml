import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1


Rectangle {
   // anchors.fill: parent

    ListModel{
        id:alarmStatusModel
        ListElement {alarmName: "Soldout-Caramel" ; state: "Alarm"; date:"03/21/14"; time:"02:00PM"; module:"System";  checked: 1}
        ListElement {alarmName: "Soldout-Caramel" ; state: "Alarm"; date:"03/21/14"; time:"02:00PM"; module:"System";  checked: 0}
        ListElement {alarmName: "Soldout-Caramel" ; state: "Alarm"; date:"03/21/14"; time:"02:00PM"; module:"System";  checked: 1}


    }
//    TableViewStyle{
//     id:tableStyle
//     backgroundColor: 'black'
//     textColor: 'white'

//    }
    TableView{
        id: alarmTable
        //style: tableStyle
        width: 800
        height: 500
        TableViewColumn{role: "alarmName"; title:"ALARM NAME"; width: 150 }
        TableViewColumn{role: "state"; title:"STATE"; width: 100}
        TableViewColumn{role: "date"; title:"DATE"; width: 100}
        TableViewColumn{role: "time"; title:"TIME"; width: 100}
        TableViewColumn{role: "module"; title:"MODULE"; width: 100}
        TableViewColumn{

            role: "checked";
            title:"SYSTEM";
            width: 100; delegate: CheckBox{id: checkBox; checked: styleData.value === 1 ?  true : false ; }}

        model: alarmStatusModel

        itemDelegate: Item{

         Text{
             anchors.verticalCenter: parent.verticalCenter
             color:'red'
             text: styleData.value

         }
        }
    }


//        }
//        section.delegate:  Item{
//         Row{
//             Text{text:index. styleData.row}
//             Text{text: styleData.row}
//             Text{text: styleData.row}
//             Text{text: styleData.row}
//             Text{text: styleData.row}
//             CheckBox{checked:styleData.row }
//         }
//        }
    }


