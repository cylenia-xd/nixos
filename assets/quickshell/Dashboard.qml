import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

PopupWindow {
  id: root
  
  required property PanelWindow parentPanel
  property bool isVisible: false

  anchor.window: parentPanel
  anchor.rect.x: parentPanel.width / 2 - width / 2
  anchor.rect.y: parentPanel.height - 2
  implicitWidth: 750
  implicitHeight: 480
  color: "#1e1e2e"
  visible: isVisible

  GridLayout {
    columns: 2
    columnSpacing: 20
    rowSpacing: 20
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight

    DashboardWidget {
      Text {
        anchors.centerIn: parent
        text: Clock.time
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 48
      }
    }

    DashboardWidget {
      Text {
        anchors.centerIn: parent
        text: Clock.date
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 32
      }
    }

    DashboardWidget {
      Text {
        anchors.centerIn: parent
        text: Weather.currentTemperature
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 48
      }
    }

    DashboardWidget {
      Text {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.topMargin: 10
        text: "user\nhost\ndistro"
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 24
      }

      Rectangle {
        anchors.centerIn: parent
        width: 2
        height: parent.height
        color: "#cba6f7"
      }

      Text {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 10
        anchors.topMargin: 10
        horizontalAlignment: Text.AlignRight
        text: `${Status.user}\n${Status.host}\n${Status.distro}`
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 24
      }
    }
  }

  Rectangle {
    anchors.bottom: parent.bottom
    width: parent.width
    height: 2
    color: "#cba6f7"
  }

  Rectangle {
    anchors.left: parent.left
    height: parent.height
    width: 2
    color: "#cba6f7"
  }

  Rectangle {
    anchors.right: parent.right
    height: parent.height
    width: 2
    color: "#cba6f7"
  }

  IpcHandler {
    target: "dashboard"
    function toggle() { root.isVisible = !root.isVisible }
  }
}
