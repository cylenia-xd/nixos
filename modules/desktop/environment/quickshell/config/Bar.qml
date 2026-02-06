import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Hyprland
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
        color: "#313244"
        height: 20
        width: workspaceText.contentWidth + 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -1

        Text {
          id: workspaceText
          anchors.centerIn: parent
          text: Hyprland.focusedWorkspace != null ? integerToRoman(Hyprland.focusedWorkspace.id) : "?"
          color: "#cba6f7"
          font.family: "Hack Nerd Font Mono"
          font.pointSize: 12
        }
      }

      Rectangle {
        color: "#313244"
        height: 20
        width: clockText.contentWidth + 10
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -1

        Text {
          id: clockText
          anchors.centerIn: parent
          text: Clock.time
          color: "#cba6f7"
          font.family: "Hack Nerd Font Mono"
          font.pointSize: 12
        }
      }

      Rectangle {
        color: "#313244"
        height: 20
        width: batteryText.contentWidth + 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -1

        Text {
          id: batteryText
          anchors.centerIn: parent
          text: Battery.battery
          color: "#cba6f7"
          font.family: "Hack Nerd Font Mono"
          font.pointSize: 12
        }
      }

      Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 2
        color: "#cba6f7"
      }
    }
  }

  function integerToRoman(num) {
    const values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    const symbols = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I'];
    let roman = '';
    for (let i = 0; i < values.length; i++) {
      while (num >= values[i]) {
        roman += symbols[i];
        num -= values[i];
      }
    }
    return roman;
  }
}
