//
//  Set.swift
//  Game_Of_Set
//
//  Created by admin on 9/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Set {
    var deck: Deck
    var hand: Array<Card>
    
    init()
    {
        deck = Deck()
        hand = self.startingHand()
    }
    
    func startingHand() -> [Card]{
        var hand: Array<Card>
        for _ in 0...12 {
            hand.append(deck.pullCard() ?? Card)
        }
        return hand
    }
    
}
