import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick

Scope {
  id: root

  Time { id: timeSource }
  Workspaces { id: workspacesSource }
  Battery { id: batterySource }

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      color: "#1e1e2e"
      implicitHeight: 30

      anchors {
        top: true
        left: true
        right: true
      }

      // Left: time
      Text {
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        text: timeSource.time
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
      }

      // Center: workspaces
      Text {
        anchors.centerIn: parent
        text: workspacesSource.workspaces
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
      }

      // Right: battery
      Text {
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        text: batterySource.battery
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
      }

      // Border
      Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 2
        color: "#cba6f7"
      }
    }
  }
}
