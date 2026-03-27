import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.Services

PanelWindow {
  id: root

  property int maxWidth: Quickshell.screens[0].width / Design.notifPopupWidthByMonitorWidthRatio


  screen: Quickshell.screens[0]
  color: Design.transparent
  visible: false
  implicitWidth: maxWidth
  implicitHeight: list.implicitHeight
  WlrLayershell.layer: WlrLayer.Overlay

  anchors {
    top: true
    right: true
  }
  
  Connections {
    target: NotificationService

    function onNotificationsChanged() {
      if (NotificationService.notifications.length > 0) {
        root.visible = true
      } else {
        root.visible = false
      }
      console.log(NotificationService.notifications.length)
    }
  }

  ListView {
    id: list

    anchors {
      top: parent.top
      left: parent.left
    }
    implicitWidth: root.maxWidth
    implicitHeight: (childrenRect.height > Quickshell.screens[0].height / 2 ? Quickshell.screens[0].height / 2 : childrenRect.height)
    model: NotificationService.notifActive
    interactive: false

    spacing: 8

    Component {
      id: notifDelegate

      Rectangle {
        id: notifContainer

        function showIcon() {
          if (modelData.appIcon === "") {
            return false
          } else {
            return true
          }
        }

        function totalContentHeight() {
          let total = 0

          // for (var rep in contentColumn.children) {
          //   console.log("totalContentHeight: " + total)
          //   console.log("item.contentHeight: " + rep.contentHeigt)
          //   total += rep.contentHeight
          // }
          //

          total = appNameT.height + summaryT.height + bodyT.height + root.maxWidth * 1/40

          return total
        }

        implicitWidth: root.maxWidth * 29/30
        implicitHeight: childrenRect.height

        color: Design.colBg
        radius: 8

        RowLayout {
          implicitWidth: root.maxWidth * 29/30
          implicitHeight: notifContainer.height

          Image {
            property int appIconSize: (notifContainer.showIcon() ? Design.iconSize : 0)
            visible: notifContainer.showIcon()
            Layout.preferredHeight: appIconSize
            Layout.preferredWidth: appIconSize
            Layout.topMargin: 8
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 8

            source: {
              if (modelData.appIcon.indexOf("/") !== -1)
                return "file://" + modelData.appIcon;

              return "image://icon/" + modelData.appIcon;
            }
          }
          
          ColumnLayout {
            id: contentColumn

            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.topMargin: 8
            Layout.bottomMargin: 8

            spacing: 0

            property int textWidth: {
              if (notifContainer.showIcon()) {
                return root.maxWidth - Design.iconSize
              } else {
                return root.maxWidth
              }
            }

            Rectangle {
              color: "transparent"
              implicitWidth: parent.width
              implicitHeight: childrenRect.height
              Text {
                id: appNameT

                width: contentColumn.textWidth
                text: NotificationService.shortenedMessage(modelData.appName)
                wrapMode: Text.WordWrap
                color: "white"

                leftPadding: 5
                rightPadding: 5

                // Layout.fillWidth: true

                font {
                  family: Design.fontFamily
                  pixelSize: Design.fontSize
                  bold: false
                }

                Component.onCompleted: {
                  if (this.text === "") {
                    this.visible = false
                    this.height = 0
                  }
                }
              }
            }
            
            Rectangle {
              color: "transparent"
              implicitWidth: parent.width
              implicitHeight: childrenRect.height

              Text {
                id: summaryT

                width: contentColumn.textWidth
                text: NotificationService.shortenedMessage(modelData.summary)
                wrapMode: Text.WordWrap
                color: "white"

                leftPadding: 5
                rightPadding: 5

                // Layout.fillWidth: true

                font {
                  family: Design.fontFamily
                  pixelSize: Design.fontSize
                  bold: false
                }

                Component.onCompleted: {
                  if (this.text === "") {
                    this.visible = false
                    this.height = 0
                  }
                }
              }
            }


            Rectangle {
              color: "transparent"
              implicitWidth: parent.width
              implicitHeight: childrenRect.height

              Text {
                id: bodyT

                width: contentColumn.textWidth
                text: NotificationService.shortenedMessage(modelData.body)
                wrapMode: Text.WordWrap
                color: "white"

                leftPadding: 5
                rightPadding: 5

                // Layout.fillWidth: true

                font {
                    family: Design.fontFamily
                    pixelSize: Design.fontSize
                    bold: false
                }

                Component.onCompleted: {
                  if (this.text === "") {
                    this.visible = false
                    this.height = 0
                  }
                }

              }
            }
          }
        }
      }
    }

    delegate: notifDelegate
  }
}
