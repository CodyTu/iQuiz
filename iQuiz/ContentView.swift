//
//  ContentView.swift
//  iQuiz
//
//  Created by Hong Ton on 5/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSettings = true
    @StateObject private var quizDataFetcher = QuizDataFetcher()
    
    var body: some View {
        NavigationView {
            List(quizDataFetcher.quizzes) {quiz in
                NavigationLink(destination: QuizDetailView(quiz: quiz)){
                    HStack {
                        Image(systemName: "questionmark.cirlce")
                        VStack(alignment: .leading) {
                            Text(quiz.title)
                            Text(quiz.description)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("iQuiz")
        .navigationBarItems(trailing: Button(action: {
            showSettings = true
        }) {
            Image(systemName: "gear")
        })
        .sheet(isPresented: $showSettings) {
            SettingsView(quizDataFetcher: quizDataFetcher)
        }
        .onAppear {
            quizDataFetcher.fetchQuizzes(from: "https://tednewardsandbox.site44.com/questions.json")
        }
    }
}

#Preview {
    ContentView()
}
