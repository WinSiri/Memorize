//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kwin Sirikwin on 23/5/20.
//  Copyright © 2020 Win Siri. All rights reserved.
//

import Foundation

struct MemoryGame<CardContentT> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContentT) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContentT
        var id: Int
    }
}
