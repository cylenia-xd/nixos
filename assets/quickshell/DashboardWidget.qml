import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
  color: "#1e1e2e"
  Layout.preferredWidth: 345
  Layout.preferredHeight: 220

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
