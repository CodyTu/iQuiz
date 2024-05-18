//
//  SettingsView.swift
//  iQuiz
//
//  Created by Hong Ton on 5/16/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var urlString: String = "https://tednewardsandbox.site44.com/questions.json"
        @ObservedObject var quizDataFetcher: QuizDataFetcher

        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Data Source")) {
                        TextField("Enter URL", text: $urlString)
                            .keyboardType(.URL)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        Button(action: {
                            quizDataFetcher.fetchQuizzes(from: urlString)
                        }) {
                            Text("Check Now")
                        }
                    }
                }
                .navigationBarTitle("Settings")
            }
        }
}
