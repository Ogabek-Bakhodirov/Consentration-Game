//
//  Cards.swift
//  ConsentrationGame
//
//  Created by Ogabek Bakhodirov on 10/12/22.
//

import Foundation

struct Cards {
    
    var identifier: Int 
    var isFaceUp = false
    var isMatched = false 
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Cards.getUniqueIdentifier()
    }
}
