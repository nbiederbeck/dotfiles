#!/usr/bin/env python
import os.path
from sys import exit

path_ac = "/sys/class/power_supply/AC"
if not os.path.exists(path_ac):
    print()
    exit()
path_battery_0 = "/sys/class/power_supply/BAT0"
path_battery_1 = "/sys/class/power_supply/BAT1"

ac = 0
battery_level_0 = 0
battery_level_1 = 0
battery_max_0 = 0
battery_max_1 = 0

if os.path.exists(f"{path_ac}/online"):
    with open(f"{path_ac}/online", "r") as f:
        ac = int(f.readline())

if os.path.exists(f"{path_battery_0}/energy_now"):
    with open(f"{path_battery_0}/energy_now", "r") as f:
        battery_level_0 = int(f.readline())

if os.path.exists(f"{path_battery_0}/energy_full"):
    with open(f"{path_battery_0}/energy_full", "r") as f:
        battery_max_0 = int(f.readline())

if os.path.exists(f"{path_battery_0}/power_now"):
    with open(f"{path_battery_0}/power_now", "r") as f:
        battery_power_0 = int(f.readline())


if os.path.exists(f"{path_battery_1}/energy_now"):
    with open(f"{path_battery_1}/energy_now", "r") as f:
        battery_level_1 = int(f.readline())

if os.path.exists(f"{path_battery_1}/energy_full"):
    with open(f"{path_battery_1}/energy_full", "r") as f:
        battery_max_1 = int(f.readline())

if os.path.exists(f"{path_battery_1}/power_now"):
    with open(f"{path_battery_1}/power_now", "r") as f:
        battery_power_1 = int(f.readline())


battery_level = battery_level_0 + battery_level_1
battery_max = battery_max_0 + battery_max_1

battery_percent = round(battery_level / battery_max * 100, 1)

try:
    battery_time_0 = round(60 * battery_level_0 / battery_power_0, 1)
except ZeroDivisionError:
    battery_time_0 = round(60 * battery_level_0 / battery_power_1, 1)

try:
    battery_time_1 = round(60 * battery_level_1 / battery_power_1, 1)
except ZeroDivisionError:
    battery_time_1 = round(60 * battery_level_1 / battery_power_0, 1)

battery_time = battery_time_0 + battery_time_1

ramp = {0: "▁", 1: "▂", 2: "▃", 3: "▄", 4: "▅", 5: "▆", 6: "▇", 7: "█"}
ramp = {0: "", 1: "", 2: "", 3: "", 4: ""}

for v, icon in ramp.items():
    if battery_percent / 100 < v / len(ramp):
        break


print(f"{icon} {int(battery_percent)}% {int(battery_time)}m")
