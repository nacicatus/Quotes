//
//  Quote.swift
//  Quotes
//
//  Created by Sauron on 10/07/18.
//  Copyright © 2018 Sauron. All rights reserved.
//

import Foundation

struct Quote {
    let text: String
    let author: String
    
    static let all: [Quote] = [
        Quote(text: "Today is a good day to die", author: "Worf"),
        Quote(text: "May the Force be with you", author: "Obi-Wan-Kenobi"),
        Quote(text: "After many lifetimes, the intelligent one takes shelter of Me, knowing Me to be Everything. Such a great soul is very rare", author: "Krishna")
    ]
}

extension Quote: CustomStringConvertible {
    var description: String {
        return "\"\(text)\" - \(author)"
    }
}
