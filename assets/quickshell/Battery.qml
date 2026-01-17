pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import QtQuick

Singleton {
  id: root
  property string battery
  
  function formatBattery(): string {
    let i = 0;
    while (true) {
      if (UPower.devices.values[i].powerSupply) {
        let batt = UPower.devices.values[i].powerSupply
        return `${UPowerDeviceState.toString(batt.state)} ${Math.round(batt.percentage)}%`
      } else { i = i + 1 }
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: battery = formatBattery()
  }
}
