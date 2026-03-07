import Quickshell // for PanelWindow
import Quickshell.Io // for Process
import QtQuick // for Text

// Code from the official Quickshell tutorial
// https://quickshell.org/docs/v0.1.0/guide/introduction
Scope {
  id: root
  property string time

  Variants {
    model: Quickshell.screens;

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      Text {
        anchors.centerIn: parent
        text: root.time
      }
    }
  }
  Process {
    id: dateProc
    command: ["date"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: root.time = this.text
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true

    onTriggered: dateProc.running = true
  }
}
