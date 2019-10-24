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
    var selectedCards: (Int, Int, Int)
    var numCardsSelected: Int
    
    init()
    {
        deck = Deck()
        hand = []
        selectedCards = (-1, -1, -1) // -1 represents 0 in this case because 0 is an element in the array
        numCardsSelected = 0 // represents the number of cards that are currently selected
        
        for _ in 0...12 {
            if let topCard = deck.pullCard() {
                hand.append(topCard)
            }
        }
    }
    
    func getHand() -> [Card] {
        return hand
    }
    
    func dealThree() -> Bool{
        for _ in 0...2 {
            if let topCard = deck.pullCard() {
                hand.append(topCard)
            }
            else{
                return false
            }
        }
        return true
    }
    
    func selectCard(index: Int) -> Bool {
        if index < hand.count {
            selectedCards
        }
    }
    
    
    
}
