//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Haskell, Tyler on 12/2/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(
            name: "Vehicles",
            emojis: ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"],
            numberOfPairsOfCards: 5,
            color: "red"),
        Theme(
            name: "Sports",
            emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🥏", "🎱", "🏒", "⛳️", "🎣", "🥌", "🏂", "🏊🏼‍♂️", "🏹", "🥊", "⛷", "⛸"],
            numberOfPairsOfCards: 6,
            color: "blue"),
        Theme(
            name: "Animals",
            emojis: ["🦆", "🦅", "🦉", "🐣", "🐺", "🐍", "🐢", "🐙", "🦑", "🦈", "🐊", "🐅", "🐘", "🐓", "🦌", "🐕", "🦃", "🐈‍⬛", "🦚", "🦩", "🐿"],
            numberOfPairsOfCards: 7,
            color: "green"),
        Theme(
            name: "Faces",
            emojis: ["😃", "😅", "😂", "🥲", "😇", "😍", "🤪", "😎", "🥳", "😩", "🤬", "🥶", "🥵", "😱", "🤢", "🤮", "🤑", "🤠"],
            numberOfPairsOfCards: 8,
            color: "yellow"),
        Theme(
            name: "Food",
            emojis: ["🍎", "🍊", "🍋", "🍌", "🍇", "🍍", "🍑", "🍆", "🥑", "🌽", "🥕", "🥬", "🥦", "🍉", "🧅", "🥔", "🥝", "🫐"],
            numberOfPairsOfCards: 9,
            color: "orange"),
        Theme(
            name: "Flags",
            emojis: ["🏴‍☠️", "🏁", "🏳️‍🌈", "🇦🇺", "🚩", "🇨🇦", "🇧🇷", "🇬🇷", "🇯🇵", "🇵🇷", "🇰🇷", "🇺🇸", "🇬🇧", "🇸🇪", "🇿🇦", "🇫🇷", "🇲🇽"],
            numberOfPairsOfCards: 10,
            color: "purple"),
        ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    var themeName: String {
        theme.name
    }
    
    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "blue":
            return .blue
        case "green":
            return .green
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        case "purple":
            return .purple
        default:
            return .gray
        }
    }
    
    var cards: Array<Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
