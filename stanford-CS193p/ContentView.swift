//
//  ContentView.swift
//  stanford-CS193p
//
//  Created by Guilherme Nascimento on 25/07/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = [
        "🐶", "🦁", "🐸", "🦊", "🐹", "🐵",
        "🐭", "🐔", "🐝", "🦄", "🦆", "🐷",
        "🐮", "🐤", "🐗", "🐺", "🦉", "🐞",
        "🦂", "🦐", "🐡", "🐬", "🐆", "🐊"
    ]
    @State var emojiCount: Int = 6
    
    var body: some View {
        VStack {
            HStack {
                Text("Memorize")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.all)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
    }
}

struct CardView: View {
    
    var content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            
            if(isFaceUp){
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        
        ContentView()
            .preferredColorScheme(.dark)
    }
}
