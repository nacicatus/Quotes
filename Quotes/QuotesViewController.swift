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
        // Do view setup here.
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
