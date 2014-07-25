import QtQuick 2.0
import QtQuick.Controls 1.0

Rectangle {
    id:self
    property string statusBarText: "System Initialization"
    property string statusBarTextColor: "white"
    property bool   statusBarTextBold: true
    property int    statusBarTextSize: 16
    property int    statusBarLeftMargin: 10
    property string statusBarBorderColor: "#D2D2D2"
    property int    statusBarBorderWidth: 4
    property string statusBarBackgroundColor: "#7a7b7a";     // the background color of the abs menus
    border.color: statusBarBorderColor
    border.width: statusBarBorderWidth
    anchors.margins: statusBarBorderWidth
    color: statusBarBackgroundColor

    Text{
        id:statusText
        text: statusBarText
        color: statusBarTextColor

        anchors{
            left: parent.left
            leftMargin: statusBarLeftMargin
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: statusBarTextSize
        font.bold: statusBarTextBold
    }
}
