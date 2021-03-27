//
//  MemoryGame.swift
//  Memorize
//
//  Created by Siriluk Rachaniyom on 12/2/2564 BE.
//

import Foundation

public var counter = 0

struct MemoryGame<CardContent: Equatable> {
    
    var cards: Array<Card>
    var shuftcard: Array<Card>
    
    init(numOfPairsOfCard: Int, cardContentFactory: (Int) ->CardContent) {
        cards = []
        shuftcard = []
        
        for pairIndex in 0..<numOfPairsOfCard{
            let content = cardContentFactory(pairIndex)
            shuftcard.append(Card(content: content))
            shuftcard.append(Card(content: content))
            
        }
        cards = shuftcard.shuffled()
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{ cards.indices.filter{ cards[$0].isFaceUp }.only}
        set{
            for index in cards.indices{
                if index == newValue{
                    cards[index].isFaceUp = true
                }else{
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    
    mutating func choose(card: Card){
        for i in 0..<numcard*2{
            if cards[i].isFaceUp == true{
                cards[i].isFaceUpBefore = true
            }
        }
        if card.isFaceUpBefore == true{
            counter -= 1
        }
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isMatched, !cards[chosenIndex].isFaceUp{
            if let potentialMathIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMathIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMathIndex].isMatched = true
                    counter += 2
                }
            }else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
            
            
        
        }
        
    }
    

    struct Card: Identifiable {
        var id = UUID()
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var isFaceUpBefore = false
    }
}
