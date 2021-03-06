#!/bin/sh

# Configure the X240 ClickPad

# 1 finger = left click, 2 finger = right click, 3 finger = middle click
synclient TapButton2=3
synclient TapButton3=2
synclient ClickFinger2=3
synclient ClickFinger3=2

# enable horizontal two-finger scrolling (vertical is enabled by default)
synclient HorizTwoFingerScroll=1
synclient VertTwoFingerScroll=1

# Where does the touch pad end to leave the remainder as real buttons
synclient AreaTopEdge=2000

# Areas must not overlap or it throws BadValue errors
synclient MiddleButtonAreaLeft=3000
synclient MiddleButtonAreaRight=4049
synclient MiddleButtonAreaTop=0
synclient MiddleButtonAreaBottom=2000

synclient RightButtonAreaLeft=4050
synclient RightButtonAreaRight=0
synclient RightButtonAreaTop=0
synclient RightButtonAreaBottom=2000
