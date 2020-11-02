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

class PreferencesWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    }

    override func keyDown(with event: NSEvent) {
        super.keyDown(with: event)
        NSSound(named: "Purr")?.play()
        if let vc = self.contentViewController as? PreferencesViewController {
            if vc.listening {
                vc.updateGlobalShortcut(event)
            }
        }
    }
}
