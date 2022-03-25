# CustomNativeElements
Customizable native iOS components that only requires SwiftUI knowledge to be used.

## Description
🧑‍💻 **Ever wanted to customise your iOS native elements?**

In SwiftUI pickers, controls, sliders, switches, etc. are hard and laborious to customise. This library tries to make it easier thanks to *UIKit integration*, by making components that work just like standard SwiftUI components, but also allow a much easier and wider range of customisation.

For now includes: 
- Segmented Control

## Usage
These components have been studied to be used as similarly as possible as you would use the native SwiftUI ones. More detailed explanations follow.
### Segmented Control
1. Create an array of `String` representing the titles of your segments
2. Create a state variable to store the `selected` index.
3. The customizable options are: font (type and size) and colors (global background and text, selected segment background and text)

**Note:** When changing the global background, the Segmented Control currently loses its default animation. There will be an attempt to solve this issue in the next update. Also *coming soon*, a way to change the font in the example program.

**Required Parameters**
**Available customizations - optional parameters**

##Example

##Installation

##Requirements
