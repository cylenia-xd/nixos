import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick

Scope {
  id: root

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      WlrLayershell.layer: WlrLayer.Bottom
      exclusionMode: ExclusionMode.Ignore
      exclusiveZone: 0

      anchors {
        top: true
        left: true
        right: true
        bottom: true
      }

      Image {
        asynchronous: true
        source: "wallpaper.jpg"
        anchors.fill: parent;
      }
    }
  }
}
