pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import QtQuick

Singleton {
  id: root
  property string battery
  
  function formatBattery(): string {
    for (const device of UPower.devices.values) {
      if (device.powerSupply)
        return `${UPowerDeviceState.toString(device.state)} ${Math.round(device.percentage)}%`;
    }
    return "Battless";
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: battery = formatBattery()
  }
}
