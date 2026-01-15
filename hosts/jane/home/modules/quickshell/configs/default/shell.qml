import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  id: root
  property string time
  property string battery
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
        text: root.time
      }
      Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
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
    id: batteryProc
    command: ["echo", "$(</sys/class/power_supply/BAT1/status) $(</sys/class/power_supply/BAT1/capacity)%"]
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
      batteryProc.running = true;
    }
  }
}
