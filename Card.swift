//
//  Card.swift
//  Game_Of_Set
//
//  Created by admin on 9/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


enum CardMemberError: Error {
    case invalidNumberOfShapes(numShapes: Int)
    case invalidShape(shape: String)
    case invalidShade(shade: String)
    case invalidColor(color: String)
}



class Card {
    var numberOfShapes: Int
    var shape: String
    var shading: String
    var color: String
    
    // This function sets the shape of the card
    private func setShape(shp: String) throws {
        if shp != "▲" || shp != "⬤" || shp != "⏹" {
            throw CardMemberError.invalidShape(shape: shp)
        }
        else {
            shape = shp
        }
    }
    
    // This function sets the color of the card
    private func setColor(col: String) throws {
        if col != "Red" || col != "Green" || col != "Blue" {
            throw CardMemberError.invalidColor(color: col)
        }
        else {
            color = col
        }
    }
    
    // This function sets the shade of the card
    private func setShade(shade: String) throws {
        if shade != "Solid" || shade != "Striped" || shade != "Open" {
            throw CardMemberError.invalidShade(shade: shade)
        }
        else {
            shading = shade
        }
    }
    
    // This function sets the number of shapes of the card
    private func setNumShapes(numShapes: Int) throws {
        if numShapes >= 1 || numShapes < 4 {
            numberOfShapes = numShapes
        }
        else {
            throw CardMemberError.invalidNumberOfShapes(numShapes: numShapes)
        }
    }
    
    
    init(numShapes: Int, shp: String, shade: String, col: String)
    {   do {
            try setShape(shp: shp)
        } catch CardMemberError.invalidShape {
            print("CardMemberError.invalidShape Error: \(shp)")
        }
        
        do {
            try setColor(col: col)
        } catch CardMemberError.invalidColor {
            print("CardMemberError.invalidColor Error: \(col)")
        } 
        
        do {
            try setNumShapes(numShapes: numShapes)
        } catch CardMemberError.invalidNumberOfShapes {
            print("CardMemberError.invalidNumberOfShapes Error: \(numShapes) ")
        }
    
        do {
            try setShade(shade: shade)
        } catch CardMemberError.invalidShade {
            print("CardMemberError.invalidNumberOfShapes Error: \(shade) ")
        }
        
    
        
        
        
        
    }
    
}
