//
//  QuizDetailView.swift
//  iQuiz
//
//  Created by Hong Ton on 5/16/24.
//

import SwiftUI


struct QuizDetailView: View {
    let quiz: QuizTopic
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: String?
    @State private var showAnswer = false
    @State private var score = 0
    
    var body: some View {
        VStack{
            if currentQuestionIndex < quiz.questions.count {
                Text(quiz.questions[currentQuestionIndex].question)
                    .padding()
                
                ForEach(quiz.questions[currentQuestionIndex].options, id: \.self) { option in
                    Button(action: {
                        selectedAnswer = option
                    }) {
                        Text(option)
                            .padding()
                    }
                }
                
                Button(action: {
                    showAnswer = true
                }) {
                    Text("Submit")
                }
                .alert(isPresented: $showAnswer) {
                    Alert(
                        title: Text(selectedAnswer == quiz.questions[currentQuestionIndex].options[Int(quiz.questions[currentQuestionIndex].correctAnswerIndex)!] ? "Correct" : "Wrong"),
                        message: Text("The correct answer is \(quiz.questions[currentQuestionIndex].options[Int(quiz.questions[currentQuestionIndex].correctAnswerIndex)!])"),
                        dismissButton: .default(Text("Next")) {
                            if selectedAnswer == quiz.questions[currentQuestionIndex].options[Int(quiz.questions[currentQuestionIndex].correctAnswerIndex)!] {
                                score += 1
                            }
                            currentQuestionIndex += 1
                            selectedAnswer = nil
                            showAnswer = false
                        }
                    )
                }
            } else {
                VStack {
                    Text("Quiz Finished")
                    Text("Your score \(score) out of \(quiz.questions.count)")
                    Button(action: {
                        currentQuestionIndex = 0
                        score = 0
                    }) {
                        Text("Restart Quiz")
                    }
                }
                .padding()
                .navigationBarTitle(Text(quiz.title), displayMode: .inline)
            }
        }
    }
}
//
//#Preview {
//    QuizDetailView(quiz: )
//}
