//
//  ContentView.swift
//  Memorize
//
//  Created by Siriluk Rachaniyom on 12/2/2564 BE.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel : EmojoMemoryGame
    var body: some View {
        HStack(alignment: .center, spacing: 170){
            Text("Score: \(counter)")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.yellow)
                .cornerRadius(40)
                .foregroundColor(.white)
                
            
            Button(action: {
                self.viewModel.restartGame()
                counter = 0
            }, label: {
                Image(systemName: "arrow.2.circlepath")
                    .font(.system(size: 30))
                    .padding(10)
                    .foregroundColor(.black)
                    //.background(Color.yellow)
                    .cornerRadius(15.0)
                
            })
        }
        Grid(viewModel.card) { card in
            Cardview(card: card).onTapGesture {
                viewModel.choose(card: card)
                    
                }
            .padding(5)
            
        }
        .foregroundColor(.orange)
        .padding()
        
    }
}

struct Cardview: View {
    var card: MemoryGame<String>.Card
    var body: some View {

        GeometryReader{ geometry in
            ZStack {
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content).font(Font.system(size: fontSize(for: geometry.size)))
                    //if numcard<4{
                    //Text(card.content).font(Font.largeTitle)
                    //}else{
                    //Text(card.content).font(Font.title3)
                        
                    //}
                    //(numcard < 4) ? Text(card.content).font(Font.largeTitle) : Text(card.content).font(Font.title3)
                    
                }else if !card.isMatched{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
                        
                }
                
            }
            //Spacer(minLength: 30)
        }.aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
    }
    
    //MARK: Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let frontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat{
        min(size.width, size.height)*0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojoMemoryGame())
    }
}
