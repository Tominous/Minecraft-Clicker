import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2


ApplicationWindow {
    visible: true
    width: 640
    height: 380
    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width
        title: qsTr("Minecraft Clicker")


        FontLoader {
            id: roboto
            source: "./assets/fonts/Roboto-Light.ttf"
        }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form
        {
            Rectangle {
                id: rectangle
                width: 640
                height: 380
                color: "#EEEEEE"

             TextField {
                id: textInput
                x: 432
                y: -40
                width: 200
                height: 33
                text: "Minecraft 1.8.8 (Blazingpack.pl)"
                font.pixelSize: 12
                onTextEdited:{
                    Click.target(textInput.text);
                }
             }

             Text {
                 id: element
                 x: 432
                 y: 0
                 width: 208
                 height: 24
                 text: qsTr("Window Name")
                 rightPadding: 0
                 topPadding: 0
                 font.family: roboto.name
                 font.bold: true
                 lineHeight: 1
                 verticalAlignment: Text.AlignVCenter
                 horizontalAlignment: Text.AlignHCenter
                 font.pixelSize: 14
             }

             Text {
                 id: element1
                 x: 0
                 y: 0
                 width: 208
                 height: 24
                 text: qsTr("R + LMB")
                 font.pixelSize: 14
                 horizontalAlignment: Text.AlignHCenter
                 topPadding: 0
                 rightPadding: 0
                 font.family: roboto.name
                 font.bold: true
                 verticalAlignment: Text.AlignVCenter
                 lineHeight: 1
             }
             SpinBox {
                 id: spinBox
                 x: 42
                 y: 235
                 width: 124
                 height: 40
                 editable: true
                 to: 100
                 from: 1
                 value: 10
                 onValueModified:{
                     Click.settingCps(spinBox.value);
                     Click.reset();
                 }

              Text {
                  id: element3
                  x: 0
                  y: -17
                  width: 124
                  height: 17
                  text: qsTr("CPS amount")
                  verticalAlignment: Text.AlignVCenter
                  font.pixelSize: 14
                  rightPadding: 0
                  font.family: roboto.name
                  horizontalAlignment: Text.AlignHCenter
                  lineHeight: 1
                  topPadding: 0
                  font.bold: true
              }
             /* CheckBox{
                  x: 479
                  y: 0
                  text: qsTr("Cursor")
                  onClicked: {
                     Click.cursor(checked)
                  }
              } */

            }

        }
        }

        Page2Form
        {
            Rectangle {
                id: rectangle1
                width: 640
                height: 380
                color: "#EEEEEE"
             SpinBox {
                           id: rspinBox
                           x: 42
                           y: 235
                           width: 124
                           height: 40
                           editable: true
                           to: 100
                           from: 1
                           value: 100
                           onValueModified:{
                               Click.rsettingCps(rspinBox.value);
                               Click.rreset();
                           }
                           Text {
                               id: element4
                               x: 0
                               y: -17
                               width: 124
                               height: 17
                               text: qsTr("CPS amount")
                               verticalAlignment: Text.AlignVCenter
                               font.pixelSize: 14
                               rightPadding: 0
                               font.family: roboto.name
                               horizontalAlignment: Text.AlignHCenter
                               lineHeight: 1
                               topPadding: 0
                               font.bold: true
                           }

                       }
                Text {
                    id: element2
                    x: 0
                    y: 0
                    width: 208
                    height: 24
                    text: qsTr("R + RMB")
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    topPadding: 0
                    rightPadding: 0
                    font.family: roboto.name
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    lineHeight: 1
                }
        }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        background: Rectangle {
            id: main
            color: "#FFC107"
        }

        TabButton {
            height: main.height
            text: qsTr("LMB")
            font.bold: true
            font.family: roboto.name
            font.pixelSize: Qt.application.font.pixelSize * 1.75
            background: Rectangle {
                        height: main.height
                        color: tabBar.currentIndex == 0 ? "#FFC107" : "#607D8B"
                    }

        }
        TabButton {
            height: main.height
            text: qsTr("RMB")
            font.bold: true
            font.family: roboto.name
            font.pixelSize: Qt.application.font.pixelSize * 1.75
            background: Rectangle {
                        height: main.height
                        color: tabBar.currentIndex == 1 ? "#FFC107" : "#607D8B"
                    }
        }
    }
}
