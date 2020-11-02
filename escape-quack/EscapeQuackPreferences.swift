//
//  GlobalKeybindPreferences.swift
//  GlobalConfigKeybind
//
//  Created by John Holland on 11/1/20.
//  Licensed MIT
//  from: https://dev.to/mitchartemis/creating-a-global-configurable-shortcut-for-macos-apps-in-swift-25e9
//  Created by Mitch Stanley on 27/01/2019.
//
struct GlobalKeybindPreferences: Codable, CustomStringConvertible {
    let function : Bool
    let control : Bool
    let command : Bool
    let shift : Bool
    let option : Bool
    let capsLock : Bool
    let carbonFlags : UInt32
    let characters : String?
    let keyCode : UInt32
    let enabled : Bool

    var description: String {
        var stringBuilder = ""
        if self.function {
            stringBuilder += "Fn"
        }
        if self.control {
            stringBuilder += "⌃"
        }
        if self.option {
            stringBuilder += "⌥"
        }
        if self.command {
            stringBuilder += "⌘"
        }
        if self.shift {
            stringBuilder += "⇧"
        }
        if self.capsLock {
            stringBuilder += "⇪"
        }
        if let characters = self.characters {
            stringBuilder += characters.uppercased()
        }
        return "\(stringBuilder)"
    }
    
    static var defaultPreferences: GlobalKeybindPreferences {
        return GlobalKeybindPreferences.init(function: false, control: false, command: false, shift: false, option: false, capsLock: false, carbonFlags: 0, characters: "", keyCode: 0, enabled: true)
    }
}
