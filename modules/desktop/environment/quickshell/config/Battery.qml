pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import QtQuick

Singleton {
    id: root

    property string battery: (
      UPower.displayDevice.ready &&
      UPower.displayDevice.isLaptopBattery
    )
      ? `${UPowerDeviceState.toString(UPower.displayDevice.state)} ${Math.round(UPower.displayDevice.percentage * 100)}%`
      : "Battless"
}
