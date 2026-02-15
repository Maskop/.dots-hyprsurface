import QtQuick
import Quickshell.Services.UPower

import qs.Components
import qs.Configs
import qs.Services

Item {
    id: batteryWidgetRoot

    width: 24
    height: 24

    UPowerDevice {
        id: batteryDevice
        deviceType: UPowerDevice.Battery
    }

    BatteryIcon {
        id: batteryIcon
        anchors.centerIn: parent
        width: parent.width
        height: parent.height

        percentage: batteryDevice.percentage
        isCharging: batteryDevice.isCharging
    }
  }
