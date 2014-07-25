import QtQuick 2.0
import QtQuick.Controls 1.1
import '../../Helix2Qt/Widgets/'
import QtQuick.Controls.Styles 1.1

Column {
    id:self
    property variant buttonsVisible: [] //fill dynamically
    property variant columnsText:  ["Pineapple Smoothies","but2","but3","but4"]
    property alias spacing: self.spacing
    signal buttonClicked(int buttonPressed)


    ListModel{
        id:colors
    }

    Repeater{
        model: buttonsVisible

        DrinkViewWidget{
            id:drinkWidget
            drinkWidgetText: columnsText[index]
            anchors.left: parent.left
            //anchors.top: navBar.bottom
            drinkWidth: 180
            drinkHeight: 80
            visible: buttonsVisible[index]

            onDrinkClicked:  {
                buttonClicked(index+1)
            }
        }
    }


}
