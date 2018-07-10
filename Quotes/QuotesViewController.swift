//
//  QuotesViewController.swift
//  Quotes
//
//  Created by Sauron on 10/07/18.
//  Copyright © 2018 Sauron. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuoteIndex = 0
    }
    
    @IBOutlet weak var textLabel: NSTextField!
    
    let quotes = Quote.all
    
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }
    
    func updateQuote() {
        textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }
    
    
    
}

extension QuotesViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> QuotesViewController {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: "QuotesViewController") as? QuotesViewController else {
            fatalError("Can't find view controller - Check Main.storyboard")
        }
        return viewcontroller
    }
}

// MARK: Actions
extension QuotesViewController {
    @IBAction func previous(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    
    @IBAction func next(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }
    
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared().terminate(sender)
    }
}
