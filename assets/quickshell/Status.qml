pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  
  property string statusJson: "{\"user\":\"user\",\"host\":\"host\",\"distro\":\"distro\"}"
  // initial value is to stop the following from erroring on startup
  property string user: JSON.parse(statusJson).user
  property string host: JSON.parse(statusJson).host
  property string distro: JSON.parse(statusJson).distro
  
  Process {
    id: statusProc
    running: true
    command: ["bash", "-c",
      "echo {\\\"user\\\":\\\"$(whoami)\\\"\\\,\\\"host\\\":\\\"$(cat /etc/hostname)\\\"\\\,\\\"distro\\\":\\\"$(. /etc/os-release && echo $ID)\\\"}"]

    stdout: StdioCollector {
      onStreamFinished: root.statusJson = this.text
    }
  }

  Timer {
    interval: 60000
    running: true
    repeat: true
    onTriggered: statusProc.running = true
  }
}
