import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.1
import '../'
import './../Widgets/'
import './../CompoundWidgets/'
    Row{
        property string blenderButtonColors: 'blue'
        property string centerWidgetBorderColor: 'white'
        property int drinkTextSize:14
        property string drinkBorderColor: "white"
        property string drinkTextColor: "white"
        property string drinkButtonColor: "#7a7b7a"
        property string middleRectColor:  "#7a7b7a"
        id: mainWindowGrid
        BlenderColumnObject{
            id:leftBlender
            blenderColumnObjectTitle:"LEFT BLENDER"
            width: parent.width*(0.25)
            height: parent.height

        }
        Column{
            width: parent.width*(0.5)
            height: parent.height

            Rectangle{
                id:drinkChoiceWidget
                width: parent.width
                height:parent.height
                border.color: centerWidgetBorderColor
                border.width: 3
                color: middleRectColor

                  NavBarFooter{
                    id:navBar
                    width: parent.width
                    height: drinkChoiceWidget.height* (0.25)
                    buttonWidth:navBar.width/buttonsVisible.length
                    buttonTextSize: drinkTextSize
                    buttonBorderColor: drinkBorderColor
                    buttonTextColor: drinkTextColor
                    buttonColors:drinkButtonColor

                    buttonHeight: drinkChoiceWidget.height* (0.25)
                    buttonsRadius: [50,50,50,50,50,50]
                    buttonsVisible: [true,true,true,true,true,true]
                    buttonsText: ['CUSTOM','SMALL','MEDIUM','LARGE',"X-LARGE","BLEND"]


                    onButtonClicked: {

                    }}
                    DrinkWidgetColumn{
                     id:drinkWidget
                     spacing: 10
                     buttonsVisible:[true,true,true,true]
                     columnsText: ["Pineapple Smoothies","Apple Smoothies","Banana Smoothies","Peach Smoothies"]
                     anchors.left: parent.left
                     anchors.leftMargin:  8
                     anchors.top: navBar.bottom
                     anchors.topMargin: 8
                    }

                    DrinkWidgetColumn{
                     id:drinkWidgetRight
                     spacing: 10
                     buttonsVisible:[false,true,true,true]
                     columnsText: ["Pineapple Smoothies","Apple Smoothies","Banana Smoothies","Peach Smoothies"]
                     anchors.right: parent.right
                     anchors.rightMargin:  8
                     anchors.top: navBar.bottom
                     anchors.topMargin: 8
                    }




            }

        }
        BlenderColumnObject{
            id:rightBlender
            blenderColumnObjectTitle:"RIGHT BLENDER"
            width: parent.width*(0.25)
            height: parent.height

        }

    }

