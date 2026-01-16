import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick

Scope {
  id: root
  property string time
  property string battery
  property string workspaces
  Variants {
    model: Quickshell.screens
    PanelWindow {
      required property var modelData
      screen: modelData
      color: "#1e1e2e"
      anchors {
        top: true
        left: true
        right: true
      }
      implicitHeight: 30
      Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
        text: root.time
      }
      Text {
        anchors.centerIn: parent
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
        text: root.workspaces
      }
      Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
        text: root.battery
      }
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
    running: true
    stdout: StdioCollector {
      onStreamFinished: root.time = this.text
    }
  }
  Process {
    id: workspacesProc
    command: ["/home/cylenia/.bin/qs_workspaces"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: root.workspaces = this.text
    }
  }
  Process {
    id: batteryProc
    command: ["bash", "-c", "cat /sys/class/power_supply/BAT1/status /sys/class/power_supply/BAT1/capacity | xargs echo -n && echo %"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: root.battery = this.text
    }
  }
  Timer {
    interval: 500
    running: true
    repeat: true
    onTriggered: {
      dateProc.running = true
      batteryProc.running = true
      workspacesProc.running = true
    }
  }
}
