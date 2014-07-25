import QtQuick 2.0
import QtQuick.Controls 1.0
import 'ContentWindows/'
Rectangle {




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

    AlarmStatusCW{
     id:alarmStatusCW
    }

    StackView{
        id:contentWindowStack
        width: parent.width
        height: parent.height
        initialItem: rect1

    }

}
