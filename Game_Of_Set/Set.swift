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
    var selectedCards: Array<Int>
    var numCardsSelected: Int { // represents the number of cards that are currently selected
        get {
            var count = 0
            for cardIndex in selectedCards {
                if cardIndex != -1 {
                    count += 1
                }
            }
            return count
        }
    }
    
    // Initializes the game of set to have a full deck of 81 shuffled cards
    // an empty hand of an array of cards
    // a selectedCards variable to know which cards are selected in the deck
    // and a numCardsSelected to know how many cards are currently selected.
    init()
    {
        deck = Deck()
        hand = []
        selectedCards =  [-1, -1, -1] // -1 represents 0 in this case because 0 is an element in the array

        
        for _ in 0...12 {
            if let topCard = deck.pullCard() {
                hand.append(topCard)
            }
        }
    }
     // Returns the current array of cards in the hand to the caller
    func getHand() -> [Card] {
        return hand
    }
    
     // Deals three cards to the current hand
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
    
    // checks to make sure the passed value is a valid index into the hand array
    func checkValidHandIndex(indexIntoHand: Int) -> Bool {
        if indexIntoHand < hand.count {
            return true
        }
        else {
            return false
        }
    }
    
    // Returns false if the index has already been selected
    // returns true if not
    func checkCardNotAlreadySelected(indexIntoHand: Int) -> Bool {
        for i in 0...self.selectedCards.count {
            if self.selectedCards[i] == indexIntoHand {
                return false
            }
        }
        return true
    }
    
    // if its a valid index into hand and the max number of cards has not been reached and the card is not already selected
    // then return true. Otherwise return false.
    func selectCard(indexIntoHand: Int) -> Bool {
        if checkValidHandIndex(indexIntoHand: indexIntoHand) &&  self.numCardsSelected < 3 &&
            checkCardNotAlreadySelected(indexIntoHand: indexIntoHand) {
            for i in 0...self.selectedCards.count{
                if self.selectedCards[i] == -1 {
                    self.selectedCards[i] = indexIntoHand
                    return true
                }
            }
            return false
        }
        return false
    }
    
    // If a card of that index has been selected then remove it and return true.
    // Otherwise return false if that card has not been selected.
    func deselectCard(indexIntoHand: Int) -> Bool {
        for i in 0...selectedCards.count {
            if self.selectedCards[i] == indexIntoHand {
                self.selectedCards[i] = -1
                return true
            }
        }
        return false
    }
    
    func checkIfSelectedCardsAreSet() -> Bool {
        // check if cards all have the same color or all different colors
        if checkColors() {
            
        }
        
        // check if cards all have the same shape or all different shapes
        if checkShapes() {
            
        }
        // check if cards all have the same shade or all different shades
        if checkShades() {
            
        }
        
        // check if cards all have the same number of shapes or all different number of shapes
        if checkNumShapes() {
            
        }
    }
    
}
