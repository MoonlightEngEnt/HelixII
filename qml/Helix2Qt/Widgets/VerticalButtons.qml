import QtQuick 2.0
import QtQuick.Controls 1.1
import '../Helix2Qt/Widgets/'
import QtQuick.Controls.Styles 1.1

// Button Row
// size: 1200 X 200


Column {
    property int buttonWidth: 20
    property int buttonHeight: 20
    property variant buttonColors: ["white","white","white","white","white","white"]
    property variant buttonsRadius: [0,0,0,0,0,0]
    property variant buttonsVisible: [] //fill dynamically
    property variant buttonsText:  ["but1","but2","but3","but4","but5","but6"]
    property variant buttonsEnabled: [true,true,true,true,true,true]
    signal buttonClicked(int buttonPressed)
    //property variant buttonsTextWidth: [buttonWidth,buttonWidth,buttonWidth,buttonWidth,buttonWidth,buttonWidth]


    ListModel{
     id:colors
    }

    Repeater{
        model: buttonsVisible

        Button{
            style: ButtonStyle{
                background: Rectangle{
                    id: buttonRecRightBlender1
                    implicitHeight: buttonHeight
                    implicitWidth: buttonWidth
                    radius: buttonsRadius[index]
                    border.color: 'black'
                    border.width: 3
                    color: buttonColors[index]
                    visible: buttonsVisible[index]

                    Text {
                        id:title
                        text: buttonsText[index]
         //               font.pixelSize: titleSize
                        wrapMode: Text.WordWrap
                        anchors.centerIn:  parent
                        visible: buttonsVisible[index]
                    }
                }
            }
            enabled:  buttonsEnabled[index]
            onClicked: {
                buttonClicked(index+1)

            }
        }
    }


}
