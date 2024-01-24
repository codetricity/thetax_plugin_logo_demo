# logo_demo for RICOH THETA X

![screenshot](readme_assets/screenshot.png)

[video demo](https://youtu.be/F5LBPCAcKA8?feature=shared)



[Official plugin development information from RICOH](https://github.com/ricohapi/theta-api-specs/tree/main/ricoh-theta-plugin)

## Overview

This is a demonstration of the API functionality of the RICOH THETA X plugin technology. The demo was made for a community video, not as a developer reference.  

## limitations of demo

The code is not intended as a reference.  The main goal was to show that the camera LCD was usable with a plugin.  Refer to the API documentation for how to stop the plugin and revert back to the RICOH camera.  The plugin needs to be shutdown by turning off the camera in this minimal example.

Please read [Notifying Completion of Plugin for information on stopping the plugin](https://github.com/ricohapi/theta-api-specs/blob/main/ricoh-theta-plugin/broadcast-intent.md#notifying-completion-of-plugin).

## debug plugin with adb connection over USB or Ethernet

While connected to USB

```text
adb tcpip 5555
```

While connected to Ethernet

```text
adb connect 192.168.2.101:5555
```

adb will not function normally over Ethernet.

```text
adb devices
List of devices attached
192.168.2.101:5555      device
```

VS Code works with adb over Ethernet.

![adb working](readme_assets/adb_debug.png)
