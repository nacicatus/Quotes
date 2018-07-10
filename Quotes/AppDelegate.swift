//
//  AppDelegate.swift
//  Quotes
//
//  Created by Sauron on 10/07/18.
//  Copyright © 2018 Sauron. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    // properties
    let popover = NSPopover()
    let statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)
    var eventMonitor: EventMonitor?
    
    // functions
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "menu-bar-icon")
            button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = QuotesViewController.freshController()
        
        
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            if let strongSelf = self, strongSelf.popover.isShown {
                strongSelf.closePopover(sender: event)
            }
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    
    //    @objc func printQuote(_ sender: Any?) {
    //        let quoteText = "Today is a good day to die"
    //        let quoteAuthor = "Worf"
    //
    //        print("\(quoteText) - \(quoteAuthor)")
    //    }
    
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
        eventMonitor?.start()
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
    
    //    func constructMenu() {
    //        let menu = NSMenu()
    //        menu.addItem(NSMenuItem(title: "Print Quote", action: #selector(AppDelegate.printQuote(_:)), keyEquivalent: "P"))
    //        menu.addItem(NSMenuItem.separator())
    //        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
    //
    //        statusItem.menu = menu
    //    }
    
}

