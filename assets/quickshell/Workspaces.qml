pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string activeWorkspace: "1"
  property string activeWorkspaceId: "1"

  Process {
    id: workspacesEventStreamProc
    command: ["niri", "msg", "-j", "event-stream"]
    running: true
    
    stdout: SplitParser {
      onRead: function (data) {
        const parsed = JSON.parse(data)

        if (parsed.WorkspaceActivated) {
          root.activeWorkspaceId = parsed.WorkspaceActivated.id
          workspacesProc.running = false
          workspacesProc.running = true
        }
      }
    }
  }

  Process {
    id: workspacesProc
    command: ["niri", "msg", "-j", "workspaces"]
    running: false

    stdout: StdioCollector {
      onStreamFinished: function () {
        const parsed = JSON.parse(this.text)
        const workspace = parsed.find(ws => ws.id == root.activeWorkspaceId)
        root.activeWorkspace = workspace ? workspace.idx : "1" 
      }
    }
  }
}
