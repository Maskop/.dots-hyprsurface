pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  readonly property string time: {
    Qt.formatDateTime(clock.date, "hh 'H'\nmm 'M'\nss 'S'")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
