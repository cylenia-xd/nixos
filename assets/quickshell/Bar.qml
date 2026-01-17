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

    // Top Panel
    PanelWindow {
      id: topPanel
      required property var modelData
      screen: modelData

      color: "#1e1e2e"
      implicitHeight: 30

      anchors {
        top: true
        left: true
        right: true
      }

      // Left: Time
      Text {
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        text: timeSource.time
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
      }

      // Center: Workspaces
      Text {
        anchors.centerIn: parent
        text: workspacesSource.workspaces
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
      }

      // Right: Battery
      Text {
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        text: batterySource.battery
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
      }

      // Bottom Border
      Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 2
        color: "#cba6f7"
      }
    }

    // Left Panel
    PanelWindow {
      required property var modelData
      screen: modelData

      color: "#1e1e2e"
      implicitWidth: 15

      anchors {
        top: true
        topMargin: topPanel.implicitHeight
        left: true
        bottom: true
      }

      // Right Border
      Rectangle {
        anchors.right: parent.right
        height: parent.height
        width: 2
        color: "#cba6f7"
      }
    }
  }
}
