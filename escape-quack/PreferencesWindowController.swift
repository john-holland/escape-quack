//
//  PreferencesWindowController.swift
//  escape-quack
//
//  Created by John Holland on 11/1/20.
//  Licensed MIT
//  from: https://dev.to/mitchartemis/creating-a-global-configurable-shortcut-for-macos-apps-in-swift-25e9
//  Created by Mitch Stanley on 27/01/2019.

import Foundation
import Cocoa
import Carbon

class PreferencesWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        becomeFirstResponder()
    }
    
    override var acceptsFirstResponder: Bool {
        get {
            return true
        }
    }

    override func keyDown(with event: NSEvent) {
        //super.keyDown(with: event)
        if let vc = self.contentViewController as? PreferencesViewController {
            if vc.listening {
                NSSound(named: "Purr")?.play()
                vc.updateGlobalShortcut(event)
            }
        }
    }
    
    override func performKeyEquivalent(with event: NSEvent) -> Bool {
            switch Int(event.keyCode) {
            case kVK_Escape:
                print("Esc pressed")
                return true
            default:
                return super.performKeyEquivalent(with: event)
            }
        }
}
