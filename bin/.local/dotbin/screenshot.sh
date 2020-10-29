#!/bin/bash
scrot --select --line 'style=dash' --exec 'feh $f; mv $f ~/Pictures/Screenshots' > /tmp/scrot.log
