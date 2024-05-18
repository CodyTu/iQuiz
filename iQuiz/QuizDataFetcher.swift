//
//  QuizDataFetcher.swift
//  iQuiz
//
//  Created by Hong Ton on 5/17/24.
//

import Foundation

class QuizDataFetcher: ObservableObject {
    @Published var quizzes: [QuizTopic] = []

    func fetchQuizzes(from urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            guard let data = data else {
                print("No data returned")
                return
            }

            do {
                let decodedQuizzes = try JSONDecoder().decode([QuizTopic].self, from: data)
                DispatchQueue.main.async {
                    self.quizzes = decodedQuizzes
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }

        task.resume()
    }
}
