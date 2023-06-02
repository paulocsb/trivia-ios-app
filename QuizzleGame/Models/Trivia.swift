//
//  Trivia.swift
//  QuizzleGame
//
//  Created by @paulocsb.
//

import Foundation

struct Trivia: Decodable {
    // We need to set the ID inside of the closure, because the API doesn' return us an ID for each result
    var id: UUID {
        UUID()
    }
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correctAnswer: String
    var options: [String]
    
    // Custom coding key, not included in the API response, so we need to set it inside the closure
    var formattedQuestion: AttributedString {
        do {
            // Formatting the question with AttributedString, because API might return some markdown text - which will be hard to read if we keep the string as is
            return try AttributedString(markdown: question)
        } catch {
            // If we run into an error, return an empty string
            print("Error setting formattedQuestion: \(error)")
            return ""
        }
    }
    // Custom coding key, not included in the API response, so we need to set it inside the closure

    var answers: [Answer] {
        do {
            // Formatting all answer strings into AttributedStrings and creating an instance of Answer for each
            let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
            var filterdIncorrects: [String] {
                return options.filter { $0 != correctAnswer }
            }
            let incorrects = try filterdIncorrects.map { answer in
                Answer(text: try AttributedString(markdown: answer), isCorrect: false)
            }
            
            // Merging the correct and incorrect arrays together
            let allAnswers = correct + incorrects
            
            // Shuffling the answers so the correct answer isn't always the first answer of the array
            return allAnswers.shuffled()
        } catch {
            // If we run into an error, return an empty array
            print("Error setting answers: \(error)")
            return []
        }
    }
}
