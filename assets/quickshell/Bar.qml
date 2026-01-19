import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: panelBar
      
      required property var modelData
      screen: modelData

      color: "#1e1e2e"
      implicitHeight: 30

      anchors {
        top: true
        left: true
        right: true
      }

      Rectangle {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.leftMargin: 5
        color: "#1e1e2e"

        RowLayout {
          spacing: 10

          Rectangle {
            Layout.preferredHeight: 20
            Layout.preferredWidth: Workspaces.activeWorkspace == "1" ? 30 : 20
            color: "#cba6f7"
          }

          Rectangle {
            Layout.preferredHeight: 20
            Layout.preferredWidth: Workspaces.activeWorkspace == "2" ? 30 : 20
            color: "#cba6f7"
          }

          Rectangle {
            Layout.preferredHeight: 20
            Layout.preferredWidth: Workspaces.activeWorkspace == "3" ? 30 : 20
            color: "#cba6f7"
          }

          Rectangle {
            Layout.preferredHeight: 20
            Layout.preferredWidth: Workspaces.activeWorkspace == "4" ? 30 : 20
            color: "#cba6f7"
          }

          Rectangle {
            Layout.preferredHeight: 20
            Layout.preferredWidth: Workspaces.activeWorkspace == "5" ? 30 : 20
            color: "#cba6f7"
          }
        }
      }

      Text {
        anchors.centerIn: parent
        text: Clock.time
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
        visible: !hover.hovered
      }

      Text {
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        text: Battery.battery
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
      }

      Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 2
        color: "#cba6f7"
      }

      HoverHandler {
        id: hover
      }

      Dashboard {
        parentPanel: panelBar
        hoverItem: hover
      }
    }
  }
}
