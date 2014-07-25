import QtQuick 2.0
import QtQuick.Controls 1.0
import 'ContentWindows/'
Rectangle {
    id:self


    Connections{
     target:diagnostics
     onCleaningDone:{
         statusBarHeader.statusBarText = message
     }
    }

    Rectangle {
        id: rect1

        color: "yellow"

    }
    Rectangle {
        id: rect2

        color: "green"

    }
    Rectangle {
        id: rect3

        color: "blue"

    }
    IngredientCalibrationCW{
        id:ingredientCalibrationCW
        width: contentWindowStack.width
        height: contentWindowStack.height
    }
    AlarmStatusCW{
        id:alarmStatusCW
        width: contentWindowStack.width
        height: contentWindowStack.height
    }
    Rectangle{
        id:mainWindow
        width: contentWindowStack.width
        height: contentWindowStack.height
        color:  "#7a7b7a"
        MainWindowCW{
            width: parent.width
            height: parent.height
        }
    }

    StatusBarHeader{
        id:statusBarHeader
        width: 800-4
        height: 35
        anchors{
            top: parent.top
            // topMargin: 5
            //  bottom: contentWindowStack.top
            //  bottomMargin: 5
        }

    }
    StackView{
        id:contentWindowStack

        width: 800
        height: 500
        initialItem: mainWindow
        anchors{
            bottom: navBar.top
            top: statusBarHeader.bottom
            //  topMargin: 5
        }
    }

    Timer {
        id: timer
        property int timeCount: 5
        onTimeCountChanged:{
            if(timeCount === 0){
                timeCount = 5
                errorPopUp.visible = false
            }
        }
        interval: 1000; running: true; repeat: true
        onTriggered:{
            timeCount--
            if(timeCount > 0){
                errorPopUp.errorPopUpTextWarning = "00:0" + timer.timeCount.toString()
                timer.start()
            }
        }
    }

    NavBarFooter{
        id:navBar
        width: 800
        height: 60
        buttonWidth:navBar.width/buttonsVisible.length
        buttonHeight: navBar.height
        buttonsVisible: [true,true,true,true,true,true]
        buttonsText: ['Menus','Back','Disable','Clean',"N/A","N/A"]
        onButtonClicked: {
            switch(buttonPressed){
            case 1:
                if( mainWindow == contentWindowStack.currentItem) {
                    contentWindowStack.push({item:rect1,immediate:true})
                }
                else if( rect1 == contentWindowStack.currentItem) {
                    contentWindowStack.push({item:rect2,immediate:true})
                }
                else if( rect2 == contentWindowStack.currentItem) {
                    contentWindowStack.push({item:rect3,immediate:true})
                }
                else if( rect3 == contentWindowStack.currentItem) {
                    contentWindowStack.push({item:alarmStatusCW,immediate:true})
                }
                break
            case 2:
                contentWindowStack.pop({immediate:true})
                break
            case 3:
                navBar.buttonsEnabled = [false,false,false,false,false]
                break
            case 4:
                errorPopUp.errorPopUpText = "Cleaning..."
                errorPopUp.visible = true
                errorPopUp.errorPopUpTextWarning = "00:0" + timer.timeCount.toString()
                timer.start()
                diagnostics.sendCleaning()
                //diagnostics.holding();
                break
            case 5:
                if( rect3 == contentWindowStack.currentItem) {
                    contentWindowStack.push({item:ingredientCalibrationCW,immediate:true})
                }
                break
            case 6:
                navBar.buttonsEnabled = [true,true,true,true,true]
                break
            }
        }
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }
    ErrorPopUp{
        id:errorPopUp
        width: contentWindowStack.width
        height: contentWindowStack.height
        errorPopUpText: "Error: Take Action"
        z:10
    }

}
