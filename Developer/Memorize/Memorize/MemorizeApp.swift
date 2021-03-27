//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Siriluk Rachaniyom on 12/2/2564 BE.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojoMemoryGame())
        }
    }
}
