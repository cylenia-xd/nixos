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
  implicitHeight: 680
  color: "#1e1e2e"
  visible: isVisible

  RowLayout {
    spacing: 20
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    implicitWidth: parent.implicitWidth
    implicitHeight: 220

    Rectangle {
      color: "#1e1e2e"
      border.color: "#cba6f7"
      border.width: 2
      Layout.preferredWidth: 345
      Layout.preferredHeight: 220

      Text {
        anchors.centerIn: parent
        text: Clock.time
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 48
      }
    }

    Rectangle {
      color: "#1e1e2e"
      border.color: "#cba6f7"
      border.width: 2
      Layout.preferredWidth: 345
      Layout.preferredHeight: 220

      Text {
        anchors.centerIn: parent
        text: Clock.date
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 32
      }
    }
  }

  Rectangle {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 20
    color: "#1e1e2e"
    border.color: "#cba6f7"
    border.width: 2
    implicitWidth: 710
    implicitHeight: 420

    Rectangle {
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottom: parent.bottom
      anchors.bottomMargin: 20
      color: "#1e1e2e"
      border.color: "#cba6f7"
      border.width: 2
      implicitWidth: parent.implicitWidth - 40
      implicitHeight: 50

      TextInput {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        focus: root.isVisible
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 24
        text: "> "
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
