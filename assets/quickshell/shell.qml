import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  property string time: ""
  property string battery: ""
  property string workspaces: ""

  function formatWorkspaces(jsonText) {
    try {
      const workspaces = JSON.parse(jsonText)

      return workspaces
        .sort((a, b) => a.idx - b.idx)
        .map(ws => ws.is_active
          ? `<${ws.idx}>`
          : `[${ws.idx}]`
        )
        .join(" ")
    } catch (e) {
      console.error("Failed to parse workspaces:", e)
      return ""
    }
  }

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

      RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        // Left: time
        Text {
          text: root.time
          color: "#cba6f7"
          font.family: "Hack Nerd Font Mono"
          font.pointSize: 12
          Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        }

        // Spacer
        Item {
          Layout.fillWidth: true
        }

        // Center: workspaces
        Text {
          text: root.workspaces
          color: "#cba6f7"
          font.family: "Hack Nerd Font Mono"
          font.pointSize: 12
          Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        // Spacer
        Item {
          Layout.fillWidth: true
        }

        // Right: battery
        Text {
          text: root.battery
          color: "#cba6f7"
          font.family: "Hack Nerd Font Mono"
          font.pointSize: 12
          Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }
      }

      // Bottom underline
      Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 2
        color: "#cba6f7"
      }
    }
  }

  Process {
    id: dateProc
    command: ["date"]
    stdout: StdioCollector {
      onStreamFinished: root.time = this.text.trim()
    }
  }

  Process {
    id: workspacesProc
    command: ["niri", "msg", "-j", "workspaces"]
    stdout: StdioCollector {
      onStreamFinished: root.workspaces = formatWorkspaces(this.text)
    }
  }

  Process {
    id: batteryProc
    command: [
      "bash", "-c",
      "cat /sys/class/power_supply/BAT1/status /sys/class/power_supply/BAT1/capacity | xargs echo -n && echo %"
    ]
    stdout: StdioCollector {
      onStreamFinished: root.battery = this.text.trim()
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      dateProc.running = true
      batteryProc.running = true
      workspacesProc.running = true
    }
  }
}
