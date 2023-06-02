//
//  TriviaView.swift
//  QuizzleGame
//
//  Created by @paulocsb.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var quizzleManager: QuizzleManager

    var body: some View {
        if quizzleManager.reachedEnd {
            VStack(spacing: 20) {
                Image(.quizzle)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()

                Text("Congratulations, you completed the game! 🥳")
                
                Text("You scored \(quizzleManager.score) out of \(quizzleManager.length)")
                
                Button {
                    Task.init {
                        await quizzleManager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(Color("Grey50"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Grey900"))
        } else {
            QuestionView()
                .environmentObject(quizzleManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(QuizzleManager())
    }
}
