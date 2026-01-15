import Quickshell
import Quickshell.Io
import QtQuick

Variants {
  model: Quickshell.screens
  delegate: Component {
    PanelWindow {
      required property var modelData
      screen: modelData
      implicitHeight: 30
      anchors {
        bottom: true
        left: true
        right: true
      }
      Text {
        id: clock
        anchors.centerIn: parent
        Process {
          id: dateProc
          command: ["date"]
          running: true
          stdout: StdioCollector {
            onStreamFinished: clock.text = this.text
          }
        }
        Timer {
          interval: 1000
          running: true
          repeat: true
          onTriggered: dateProc.running = true
        }
      }
    }
  }
}
