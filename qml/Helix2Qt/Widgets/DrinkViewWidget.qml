import QtQuick 2.0

Rectangle {
    property int drinkWidth: 180
    property int drinkHeight: 80
    property int titleSize: 12
    property string drinkImage:"../pics/actionCancel_Circle.png"
    property alias warningVisible: warning.buttonVisible
    property alias drinkWidgetText: title.text
    property string drinkButtonBorderColor: 'white'
        property string drinkButtonTextColor: 'white'
    property int buttonBorderWidth: 3
    property string drinkbuttonColor: "black"
    property bool   drinkTextBold: true


    signal drinkClicked

    width: drinkWidth
    height: drinkHeight
    border.color: drinkButtonBorderColor
    border.width: buttonBorderWidth
    color: drinkbuttonColor

    GenericQTButton{
        id:buttonOne
        buttonHeight: parent.height
        buttonWidth: parent.width*(3/10)
        buttonRadius: 0
        buttonImageSource: drinkImage
        buttonColor: drinkButtonBorderColor
        buttonBorderColor: drinkButtonBorderColor
        enabled: false

    }


    Text {
        id:title
        width: parent.width*(4/10)
        height:parent.height
        font.pixelSize: titleSize
        wrapMode: Text.WordWrap
        anchors.left:  buttonOne.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height*(0.25)
        visible: true
        color:drinkButtonTextColor
        //font.bold: drinkTextBold

    }

    GenericQTButton{
        id:warning
        buttonHeight: 20
        buttonWidth: 20
        buttonRadius: 0
        buttonVisible: true
        buttonImageSource: "../pics/warningRed_blk_20x20.png"
        buttonColor: drinkbuttonColor
        buttonBorderColor: drinkbuttonColor
        onButtonClicked: {
           // blenderButtonColors = "../pics/warningRed_blk_20x20.png"
        }
        anchors.left:  title.right
        anchors.leftMargin: -5
        anchors.verticalCenter: parent.verticalCenter
        enabled: false
    }
    MouseArea {
        anchors.fill: parent
        onClicked:  {
            console.log("clicked")
            drinkClicked()

        }
    }

}
