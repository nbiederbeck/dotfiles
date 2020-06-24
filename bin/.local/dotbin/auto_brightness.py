#!/usr/bin/env python3
import i3ipc
import os

SET_BRIGHTNESS = "xbacklight -set "
# SET_BRIGHTNESS = "xrandr --output eDP1 --brightness "
GET_BRIGHTNESS = "xbacklight"
# GET_BRIGHTNESS = "xrandr --verbose | rg ' connected'  -A5 | rg Brightness | cut -d: -f2"
i3 = i3ipc.Connection()


class BrightnessController:
    def __init__(self):
        self.brightness_map = {}
        # Subscribe to events
        i3.on("workspace::focus", self.on_workspace_focus)
        # Start main loop
        i3.main()

    def get_brightness(self):
        return os.popen(GET_BRIGHTNESS).read()

    def set_brightness(self, brightness):
        os.system(SET_BRIGHTNESS + brightness)

    # Define a callback to be called when you switch workspaces.
    def on_workspace_focus(self, connection, e):
        current_brightness = float(self.get_brightness())
        # print(current_brightness)
        if e.old:
            self.brightness_map[e.old.id] = str(current_brightness)

        if e.current:
            if e.current.id in self.brightness_map:
                self.set_brightness(self.brightness_map[e.current.id])
            else:
                self.set_brightness(self.brightness_map[e.old.id])


bc = BrightnessController()
