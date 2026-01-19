
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Rectangle {
anchors.left: parent.left
anchors.top: parent.top
anchors.topMargin: 4
anchors.leftMargin: 5
color: "#1e1e2e"

RowLayout {
  spacing: 4

  Rectangle {
    Layout.preferredHeight: 20
    Layout.preferredWidth: Workspaces.activeWorkspace == "1"? 40 : 20
    radius: 10
    color: "#cba6f7"
  }

  Rectangle {
    Layout.preferredHeight: 20
    Layout.preferredWidth: Workspaces.activeWorkspace == "2"? 40 : 20
    radius: 10
    color: Workspaces.activeWorkspace == "2" ? "#cba6f7" : "#cdd6f4"
  }

  Rectangle {
    Layout.preferredHeight: 20
    Layout.preferredWidth: Workspaces.activeWorkspace == "3"? 40 : 20
    radius: 10
    color: Workspaces.activeWorkspace == "3" ? "#cba6f7" : "#cdd6f4"
  }

  Rectangle {
    Layout.preferredHeight: 20
    Layout.preferredWidth: Workspaces.activeWorkspace == "4"? 40 : 20
    radius: 10
    color: Workspaces.activeWorkspace == "4" ? "#cba6f7" : "#cdd6f4"
  }
  
  Rectangle {
    Layout.preferredHeight: 20
    Layout.preferredWidth: Workspaces.activeWorkspace == "5"? 40 : 20
    radius: 10
    color: Workspaces.activeWorkspace == "5" ? "#cba6f7" : "#cdd6f4"
  }
}
}
