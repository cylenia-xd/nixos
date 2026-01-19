
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
      property string workspace: "1"
      color: "#1e1e2e"
      Layout.preferredHeight: 20
      Layout.preferredWidth: 20

      Text {
        text: parent.workspace
        color: Workspaces.activeWorkspace == parent.workspace ? "#cba6f7" : "#cdd6f4"
      }
    }

    Rectangle {
      property string workspace: "2"
      color: "#1e1e2e"
      Layout.preferredHeight: 20
      Layout.preferredWidth: 20

      Text {
        text: parent.workspace
        color: Workspaces.activeWorkspace == parent.workspace ? "#cba6f7" : "#cdd6f4"
      }
    }

    Rectangle {
      property string workspace: "3"
      color: "#1e1e2e"
      Layout.preferredHeight: 20
      Layout.preferredWidth: 20

      Text {
        text: parent.workspace
        color: Workspaces.activeWorkspace == parent.workspace ? "#cba6f7" : "#cdd6f4"
      }
    }

    Rectangle {
      property string workspace: "4"
      color: "#1e1e2e"
      Layout.preferredHeight: 20
      Layout.preferredWidth: 20

      Text {
        text: parent.workspace
        color: Workspaces.activeWorkspace == parent.workspace ? "#cba6f7" : "#cdd6f4"
      }
    }
    
    Rectangle {
      property string workspace: "5"
      color: "#1e1e2e"
      Layout.preferredHeight: 20
      Layout.preferredWidth: 20

      Text {
        text: parent.workspace
        color: Workspaces.activeWorkspace == parent.workspace ? "#cba6f7" : "#cdd6f4"
      }
    }
  }
}
