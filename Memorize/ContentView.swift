//
//  ContentView.swift
//  Memorize
//
//  Created by Haskell, Tyler on 11/15/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

//    @State var emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    var vehicleEmojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    var sportEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🥏", "🎱", "🏒", "⛳️", "🎣", "🥌", "🏂", "🏊🏼‍♂️", "🏹", "🥊", "⛷", "⛸"]
    var animalEmojis = ["🦆", "🦅", "🦉", "🐣", "🐺", "🐍", "🐢", "🐙", "🦑", "🦈", "🐊", "🐅", "🐘", "🐓", "🦌", "🐕", "🦃", "🐈‍⬛", "🦚", "🦩", "🐿"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Memorize!")
                    .font(.title)
                    .foregroundColor(Color.black)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))] ) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                Spacer()
                vehicles
                Spacer()
                sports
                Spacer()
                animals
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    var vehicles: some View {
        Button(action: {
            emojis = vehicleEmojis.shuffled()
            emojiCount = Int.random(in: 4..<vehicleEmojis.count)
        }) {
            VStack {
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("Vehicles")
            }
        }
    }
    
    var sports: some View {
        Button(action: {
            emojis = sportEmojis.shuffled()
            emojiCount = Int.random(in: 4..<sportEmojis.count)
        }) {
            VStack {
                Image(systemName: "sportscourt")
                    .font(.largeTitle)
                Text("Sports")
            }
        }
    }
    
    var animals: some View {
        Button(action: {
            emojis = animalEmojis.shuffled()
            emojiCount = Int.random(in: 4..<animalEmojis.count)
        }) {
            VStack {
                Image(systemName: "pawprint")
                    .font(.largeTitle)
                Text("Animals")
            }
        }
    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.none)
        
    }
}
