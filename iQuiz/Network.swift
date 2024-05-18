//
//  Network.swift
//  iQuiz
//
//  Created by Hong Ton on 5/16/24.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    @Published var quizzes: [QuizTopic] = []
    private var cancellable: AnyCancellable?
    
    func fetchQuizzes(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: [QuizTopic].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .assign(to: \.quizzes, on: self)
    }
}
