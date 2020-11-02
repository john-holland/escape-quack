# escape quack

A small utitlity to give you an audio notification when you press the virtual touchbar escape button.

This is a learning exercise for me, so please forgive the niave setup etc.

## installation

`cd escape-quack`
`carthage update && carthage build --platform MacOS`

open in xcode, and run.

### todo:
 
* hotkey doesn't seem to be hooked up globally or turned on properly?
* escape key isn't firing events - maybe you have to hook onto NSTouchBar items or something
