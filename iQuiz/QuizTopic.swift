//
//  quizTopics.swift
//  iQuiz
//
//  Created by Hong Ton on 5/16/24.
//

import Foundation

struct QuizTopic: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
    let questions: [QuizQuestion]
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "desc"
        case questions
    }
}

struct QuizQuestion: Identifiable, Codable {
    let id = UUID()
    let question: String
    let correctAnswerIndex: String
    let options: [String]
    
    enum CodingKeys: String, CodingKey {
        case question = "text"
        case correctAnswerIndex = "answer"
        case options = "answers"
    }
}
