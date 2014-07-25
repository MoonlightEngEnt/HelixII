import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1



Rectangle {
    property string blenderButtonColors: 'blue'
    anchors.top: parent.top
    anchors.topMargin: 5

    Row{
        ScrollView{
            width: 500
            height: 400
            GridLayout{
                width: 500
                height: 400
                columns: 6
                Repeater{
                    model: 50

                    Button{
                        style: ButtonStyle{
                            background: Rectangle{
                                id: buttonRecRightBlenders
                                implicitHeight: 60
                                implicitWidth: 60
                                radius: 100
                                border.color: 'black'
                                border.width: 3

                                color: blenderButtonColors
                            }
                        }
                        onClicked: {
                            blenderButtonColors = 'green'
                        }
                    }
                }

            }
        }
        Rectangle{
            width: 200
            height:400
            border.color: 'black'
            border.width: 3
        }
    }
}
