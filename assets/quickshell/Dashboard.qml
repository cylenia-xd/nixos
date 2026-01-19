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
  implicitHeight: 500
  color: "#1e1e2e"
  visible: isVisible

  ColumnLayout {
    spacing: 20
    anchors.centerIn: parent
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight

    Rectangle {
      Layout.alignment: Qt.AlignCenter
      color: "#1e1e2e"
      Layout.preferredWidth: 460
      Layout.preferredHeight: 220

      Text {
        anchors.centerIn: parent
        text: Clock.time
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 48
      }

      Rectangle {
        anchors.top: parent.top
        width: parent.width
        height: 2
        color: "#cba6f7"
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
    }

    Rectangle {
      Layout.alignment: Qt.AlignCenter
      color: "#1e1e2e"
      Layout.preferredWidth: 460
      Layout.preferredHeight: 220

      Text {
        anchors.centerIn: parent
        text: Clock.date
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 48
      }

      Rectangle {
        anchors.top: parent.top
        width: parent.width
        height: 2
        color: "#cba6f7"
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
