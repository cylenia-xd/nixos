pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string battery
  
  Process {
    id: batteryProc
    command: [
      "bash", "-c",
      "cat /sys/class/power_supply/BAT1/status /sys/class/power_supply/BAT1/capacity | xargs echo -n && echo %"
    ]
    running: true

    stdout: StdioCollector {
      onStreamFinished: root.battery = this.text.trim()
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: batteryProc.running = true
  }
}
