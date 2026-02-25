import Quickshell
import QtQuick
// import "Screenspace.qml"

Rectangle {
  id: popupButton
  implicitWidth: parent.height - 4
  implicitHeight: parent.height - 4
  color: Design.colBg
  radius: 4

  Text {
    text: ""
    color: Design.colFg
    anchors {
      horizontalCenter: parent.horizontalCenter
      verticalCenter: parent.verticalCenter
    }

    font {
      family: Design.fontFamily
      pixelSize: Design.fontSize
    }
  }

  property var test: false

  MouseArea {
    anchors.fill: parent
    onClicked: {
      appsWorkspaces.visible = !appsWorkspaces.visible
      console.log("Popup.visible = " + appsWorkspaces.visible)
      test = !test
      console.log("test = " + test)
    }
  }
}
