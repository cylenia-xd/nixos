pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string workspaces

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

  Process {
    id: workspacesProc
    command: ["niri", "msg", "-j", "workspaces"]
    running: true
    
    stdout: StdioCollector {
      onStreamFinished: root.workspaces = formatWorkspaces(this.text)
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: workspacesProc.running = true
  }
}
