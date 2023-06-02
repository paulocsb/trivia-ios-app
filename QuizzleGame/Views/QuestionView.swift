//
//  QuestionView.swift
//  QuizzleGame
//
//  Created by @paulocsb.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizzleManager: QuizzleManager

    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Quizzle")
                    .lilacTitle()
            }
            
            ProgressBar(progress: quizzleManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {                
                VStack(alignment: .center, spacing: 10) {
                    VStack(alignment: .trailing) {
                        Text("\(quizzleManager.index + 1) out of \(quizzleManager.length)")
                            .foregroundColor(Color("Grey"))
                            .font(.system(size: 14))
                    }
                    
                    VStack(alignment: .trailing) {
                        Text(quizzleManager.question)
                            .font(.system(size: UIFont.labelFontSize))
                            .bold()
                            .padding([.trailing, .leading])
                            .foregroundColor(Color("Grey50"))
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack {
                        ForEach(quizzleManager.answerChoices, id: \.id) { answer in
                            AnswerRow(answer: answer)
                                .environmentObject(quizzleManager)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("Grey900"))
                .cornerRadius(20)
            }
            
            Button {
                quizzleManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: quizzleManager.answerSelected ? Color("Primary") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.127))
            }
            .disabled(!quizzleManager.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("Secondary"))
        .navigationBarHidden(true)
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuizzleManager())
    }
}
