//
//  Deck.swift
//  Game_Of_Set
//
//  Created by admin on 9/13/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


struct Deck {
    var cards: Array<Card>
    
    init() {
        cards = Array(repeating: Card(), count: 81)
        
    }
}
