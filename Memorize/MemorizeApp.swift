//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Haskell, Tyler on 11/15/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
