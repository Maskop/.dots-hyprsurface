import Quickshell

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        bottom: true
      }

      implicitWidth: 50

      color: "#000000"

      ClockWidget {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        // no more time binding
      }

      
    }
  }
}
