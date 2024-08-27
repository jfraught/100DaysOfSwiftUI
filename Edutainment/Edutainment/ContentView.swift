//
//  ContentView.swift
//  Edutainment
//
//  Created by Jordan Fraughton on 8/26/24.
//

import SwiftUI

struct Question {
    var multiplicand: Int
    var multiplier: Int
    
    var text: String {
        "What is \(multiplicand) x \(multiplier)?"
    }
    
    var answer: Int {
        multiplicand * multiplier
    }
}

struct ContentView: View {
    @State private var gameIsStarted = false
    @State private var multiplicand = 1
    @State private var questionCount = 5
    @State private var questionNumber = 0
    @State private var guess: Int = 0
    @State private var showingScore = false
    @State private var showingResults = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questions = [Question]()
    
    let numberOfQuestionOptions = [5, 10, 20]
    
    
    var body: some View {
        if !gameIsStarted {
            NavigationStack {
                Form {
                    Section("Multiplication Table") {
                        Stepper("\(multiplicand)", value: $multiplicand, in: 1...12)
                    }
                    
                    Section("Number of Questions") {
                        Picker("Number of questions", selection: $questionCount) {
                            ForEach(numberOfQuestionOptions, id: \.self) {
                                Text($0, format: .number)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                .navigationTitle("Mulitply")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Start", action: startGame)
                }
            }
        } else {
            NavigationStack {
                List {
                    Section("Question") {
                        Text(questions[questionNumber].text)
                    }
                    
                    Section("Answer") {
                        TextField("Guess", value: $guess, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                    }
                }
                .navigationTitle("Question \(questionNumber + 1) of \(questionCount)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Guess") {
                        guessEntered()
                    }
                }
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    Text("Your score is \(score)")
                }
                .alert("Game over!", isPresented: $showingResults) {
                    Button("Okay", action: {})
                } message: {
                    Text("Your final score was \(score)")
                }
            }
        }
    }
    
    func startGame() {
        gameIsStarted.toggle()
        let randomMultipliers = Array(1...20).shuffled().prefix(questionCount)
        
        for randomMultipier in randomMultipliers {
            questions.append(Question(multiplicand: multiplicand, multiplier: randomMultipier))
        }
    }
    
    func askQuestion() {
        questionNumber += 1
        guess = 0
    }
    
    func guessEntered() {
        if guess == questions[questionNumber].answer {
            score += 1
            scoreTitle = "Correct!"
        } else {
            scoreTitle = "Wrong! The answer is \(questions[questionNumber].answer)"
        }
        
        if questionNumber == questionCount {
            showingResults = true
        } else {
            showingScore = true
        }
        
        
    }
}

#Preview {
    ContentView()
}
