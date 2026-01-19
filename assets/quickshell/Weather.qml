pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string currentTemperature

  function formatTemperature(weatherJson: string): string {
    const parsed = JSON.parse(weatherJson)
    const unit = parsed.hourly_units.temperature_2m
    const temp = parsed.hourly.temperature_2m[Clock.hour - 1]
    return temp + unit
  }
  
  Process {
    id: weatherProc
    running: true
    command: ["curl", "-s", "https://api.open-meteo.com/v1/forecast?latitude=-37.814&longitude=144.9633&hourly=temperature_2m&timezone=Australia%2FSydney&forecast_days=1"]

    ///////////////////////////////////////////////////////////////////////////
    //                                                                       //
    // fyi this is NOT my lat & long, just the average vicinity              //
    // it's the city of Melbourne which I live a 1 to 3 hour drive away from //
    // if you "dox" this information i WILL laugh at you!                    //
    //                                                                       //
    ///////////////////////////////////////////////////////////////////////////

    stdout: StdioCollector {
      onStreamFinished: {
        console.log(this.text)
        root.currentTemperature = formatTemperature(this.text)
      }
    }
  }

  Timer {
    interval: 1800000
    running: true
    repeat: true
    onTriggered: weatherProc.running = true
  }
}
