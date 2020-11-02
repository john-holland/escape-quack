//
//  AppDelegate.swift
//  AppDelegate
//
//  Created by John Holland on 11/1/20.
//  Licensed MIT
//  from: https://dev.to/mitchartemis/creating-a-global-configurable-shortcut-for-macos-apps-in-swift-25e9
//  Created by Mitch Stanley on 27/01/2019.
//

import Cocoa
import HotKey
import Carbon

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if Storage.fileExists("globalKeybind.json", in: .documents) {

            let globalKeybinds = Storage.retrieve("globalKeybind.json", from: .documents, as: GlobalKeybindPreferences.self)
            AppDelegate.hotKey = HotKey(keyCombo: KeyCombo(carbonKeyCode: globalKeybinds.keyCode, carbonModifiers: globalKeybinds.carbonFlags))
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    public static var hotKey: HotKey? {
        didSet {
            guard let hotKey = hotKey else {
                return
            }

            hotKey.keyDownHandler = { [self] in
                NSApplication.shared.orderedWindows.forEach({ (window) in
                    if let mainWindow = window as? MainWindow {
                        print("woo")
                        let globalKeybinds = Storage.retrieve("globalKeybind.json", from: .documents, as: GlobalKeybindPreferences.self)
                        
                        if globalKeybinds.enabled {
                            NSSound(named: "Purr")?.play()
                        }
                            
                        NSApplication.shared.activate(ignoringOtherApps: true)
                        mainWindow.makeKeyAndOrderFront(self)
                        mainWindow.makeKey()
                    }
                })

            }
        }
    }
}
