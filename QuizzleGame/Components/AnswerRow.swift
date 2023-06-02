//
//  AnswerRow.swift
//  QuizzleGame
//
//  Created by @paulocsb.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var quizzleManager: QuizzleManager
    var answer: Answer
    @State private var isSelected = false

    // Custom colors
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack {
            HStack {
                if(isSelected) {
                    Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                        .padding()
                        .font(.caption)
                        .foregroundColor(answer.isCorrect ? green : red)
                } else {
                    Image(systemName: "circle")
                        .font(.caption)
                        .foregroundColor(Color("Grey"))
                        .padding()
                }
                
                Text(answer.text)
                    .fontWeight(.bold)
                    .font(.system(size: UIFont.labelFontSize))
                    .foregroundColor(Color("Grey50"))
                    .multilineTextAlignment(.leading)
                    .padding([.top, .bottom, .trailing])
                
                // This pushes the content to the left
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(isSelected ? (answer.isCorrect ? Color("AccentDarkGreen") : Color("AccentDark")) : Color("Grey700"))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? (answer.isCorrect ? Color("Success") : Color("Error")) : Color("Grey"))
        .cornerRadius(10))
        .padding(.horizontal)
        .onTapGesture {
            if !quizzleManager.answerSelected {
                isSelected = true
                quizzleManager.selectAnswer(answer: answer)

            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect:  false))
            .environmentObject(QuizzleManager())
    }
}
