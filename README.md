# QuizzleGame – iOS Trivia App

> This project was created as part of a iOS development tutorial.

Welcome to QuizzleGame, a simple yet fun iOS Trivia Game built with SwiftUI. This project was developed as part of a development tutorial session where we learned how to build a trivia app from scratch for iOS.

It connects to a local or remote backend that serves trivia questions and showcases concepts like data modeling, decoding JSON, formatting text, and shuffling quiz answers.

## 🔧 API Setup

The app loads questions from:
```bash
http://localhost:3004/questions
```
You can change this endpoint in the app to point to a development or production server.

> Note: For local testing, make sure your server is running and accessible from the iOS simulator or device.

## 📦 Data Model

The project uses two Swift models:

### Trivia.swift

Represents each trivia question. Fields include:

```swift
var category: String
var type: String
var difficulty: String
var question: String
var correctAnswer: String
var options: [String]
```

It also includes computed properties:
- id: Generates a UUID since the API does not provide one
- formattedQuestion: Converts markdown text into readable AttributedString
- answers: Combines and shuffles the correct and incorrect answers into an array of Answer objects

### Answer.swift

Represents each answer option:

```swift
var id = UUID()
var text: AttributedString
var isCorrect: Bool
```

## 🚀 Getting Started

1. Clone the repository:

```bash
git clone https://github.com/paulocsb/trivia-ios-app.git
cd trivia-ios-app
```

1. Open the project in Xcode.
1. Make sure your trivia API is running locally or remotely at the endpoint defined in the app.
1. Build and run the app on the simulator or your device.

## 🛠️ Customization

You can adapt this app for your own trivia datasets by modifying:

- The API endpoint URL
- The JSON structure (update the Trivia model accordingly)
- The game logic or UI to support new features (timers, scores, categories, etc.)

