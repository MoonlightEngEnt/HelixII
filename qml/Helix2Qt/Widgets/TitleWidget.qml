import QtQuick 2.0

Rectangle{
    id:titleRect
    property alias titleText: title.text
    property alias titleRadius: titleRect.radius
    property string titleTextColor: 'white'
    property string titleBorderColor: 'white'
    property bool   titleTextBold: true
    property int borderWidth: 3
    property string titleBackgroundColor: "#7a7b7a"
    width: parent.width
    height: 50
    radius: 20
    border.color: titleBorderColor
    border.width: borderWidth
    color: titleBackgroundColor

    Text {
        id:title
        text:"blend"
        font.bold: titleTextBold
        color:titleTextColor
        anchors.top: parent.top;
        anchors.topMargin: parent.height *(0.30)
        //               font.pixelSize: titleSize
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
