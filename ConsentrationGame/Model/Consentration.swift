//
//  Consentration.swift
//  ConsentrationGame
//
//  Created by Ogabek Bakhodirov on 10/12/22.
//

import Foundation

class Consentration {
    
    var cards = [Cards]()
        
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for faceDownIndex in 0...cards.count-1 {
                    cards[faceDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
        
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Cards()
            cards += [card, card]
        }
        self.cards.shuffle()
    }
}
