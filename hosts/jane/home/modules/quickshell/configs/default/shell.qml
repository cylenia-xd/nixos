import Quickshell
import Quickshell.Io
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
        text: root.time
      }
      Text {
        anchors.centerIn: parent
        text: root.workspaces
      }
      Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        text: root.battery
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
    command: ["bash", "-c", "niri msg -j workspaces | jq -r 'sort_by(.idx) | map(if .is_active then \"<\\\\(.idx)>\" else \"[\\\\(.idx)]\" end) | join(\" \")'"]
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
