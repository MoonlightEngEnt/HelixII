import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.1
import '../'

Column{
    property alias blenderColumnObjectTitle: title.titleText
    property string blenderMiddleRectColor:  "#7a7b7a"
    property string blenderMiddleRectBorderColor: "white"
    property int  blenderBorderWidth: 4

    width: parent.width
    height: parent.height

    spacing: 5

    TitleWidget {
     id:title
     titleBackgroundColor: "black"
    }
    Rectangle{
        width: parent.width
        height:360
        border.color: blenderMiddleRectBorderColor
        border.width: blenderBorderWidth
        color: blenderMiddleRectColor
    }

    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        GenericQTButton{
         id:buttonOne
         buttonHeight: 80
         buttonWidth: 80
         buttonRadius: 100
         buttonImageSource: "../pics/actionCancel_Circle.png"
         buttonColor: blenderButtonColors
         onButtonClicked: {
             blenderButtonColors = "black"
         }
        }
        GenericQTButton{
         id:buttonTwo
         buttonHeight: 80
         buttonWidth: 80
         buttonImageSource: "../pics/actionBlend_Circle.png"
         buttonRadius: 100
         buttonColor: blenderButtonColors
         onButtonClicked: {
             blenderButtonColors = "black"
         }
        }

    }
}
