//
//  ContentView.swift
//  QuizzleGame
//
//  Created by @paulocsb.
//

import SwiftUI

struct ContentView: View {
    @StateObject var quizzleManager = QuizzleManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack {
                    Image(.quizzle)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Text("Are you ready to test out your trivia skills?")
                        .foregroundColor(Color("Grey50"))
                }
                
                NavigationLink {
                    TriviaView()
                        .environmentObject(quizzleManager)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color("Grey900"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
