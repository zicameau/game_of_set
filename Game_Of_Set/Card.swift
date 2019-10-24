//
//  Card.swift
//  Game_Of_Set
//
//  Created by admin on 9/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit


enum CardMemberError: Error {
    case invalidNumberOfShapes(numShapes: Int)
    case invalidShape(shape: Shapes)
    case invalidShade(shade: Shades)
    case invalidColor(color: UIColor)
}

enum Shapes: String, CaseIterable {
    case triangle = "▲"
    case circle = "⬤"
    case square = "⏹"
}

enum Shades: Float, CaseIterable {
    case solid = 1.0
    case striped = 0.15
    case open = 0.0
}

class Card {
    var numberOfShapes: Int
    var shape: Shapes
    var shading: Shades
    var color: UIColor
    
    // This function sets the shape of the card
    private func setShape(shp: Shapes) throws {
        if shp != Shapes.triangle || shp != Shapes.circle || shp != Shapes.square {
            throw CardMemberError.invalidShape(shape: shp)
        }
        else {
            shape = shp
        }
    }
    
    // This function sets the color of the card
    private func setColor(col: UIColor) throws {
        if col != UIColor.Colors.Red || col != UIColor.Colors.Green || col != UIColor.Colors.Blue {
            throw CardMemberError.invalidColor(color: col)
        }
        else {
            color = col
        }
    }
    
    // This function sets the shade of the card
    private func setShade(shade: Shades) throws {
        if shade != Shades.solid || shade != Shades.striped || shade != Shades.open {
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
    
    
    init(numShapes: Int, shp: Shapes, shade: Shades, col: UIColor)
    {
        numberOfShapes = numShapes
        shape = shp
        shading = shade
        color = col
        
        
        do {
            try setShape(shp: shp)
        } catch CardMemberError.invalidShape {
            print("CardMemberError.invalidShape Error: \(shp)")
        } catch {
        
        }
        
        do {
            try setColor(col: col)
        } catch CardMemberError.invalidColor {
            print("CardMemberError.invalidColor Error: \(col)")
        } catch {
            
        }
        
        do {
            try setNumShapes(numShapes: numShapes)
        } catch CardMemberError.invalidNumberOfShapes {
            print("CardMemberError.invalidNumberOfShapes Error: \(numShapes) ")
        } catch {
            
        }
    
        do {
            try setShade(shade: shade)
        } catch CardMemberError.invalidShade {
            print("CardMemberError.invalidNumberOfShapes Error: \(shade) ")
        } catch {
            
        }
    }
    
}

extension UIColor {
    struct Colors{
        static var Red: UIColor  { return UIColor(red: 1, green: 0, blue: 0, alpha: 1) }
        static var Green: UIColor { return UIColor(red: 0, green: 1, blue: 0, alpha: 1) }
        static var Blue: UIColor { return UIColor(red: 0, green: 0, blue: 1, alpha: 1) }
    }
}
