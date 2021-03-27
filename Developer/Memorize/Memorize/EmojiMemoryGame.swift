//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Siriluk Rachaniyom on 12/2/2564 BE.
//

import SwiftUI

//func createCard(pairIndex: Int) -> String {
    //return "😘"
//}
public var numcard = Int.random(in: 4...12)
class EmojoMemoryGame: ObservableObject{
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var card: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card)  {
        model.choose(card: card)
    }
    
    static func createMemoryGame() ->MemoryGame<String>{
        var emoji = ["👻","🎃","😈","👽","🐶","🦋","🐙","🐳","🐞","🦥","🦜","⛄️"]
        
        emoji.shuffle()
        numcard = Int.random(in: 4...12)
        return MemoryGame<String>(numOfPairsOfCard: numcard){emoji[$0]}
        
    }
    func restartGame() {
        model = EmojoMemoryGame.createMemoryGame()
    }
}
