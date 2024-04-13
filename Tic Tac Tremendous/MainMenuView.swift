//
//  MainMenu.swift
//  Tic Tac Tremendous
//
//  Created by Dragomir Mindrescu on 13.04.2024.
//

import SwiftUI

struct MainMenuView: View {
    @State private var playerOneName: String = ""
    @State private var playerTwoName: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Tic Tac Tremendous")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                TextField("Player 1", text: $playerOneName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Player 2", text: $playerTwoName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                NavigationLink(destination: GameView(playerOneName: playerOneName, playerTwoName: playerTwoName)) {
                    Text("Start Game")
                        .foregroundColor(.white)
                        .padding()
                        .background(playerOneName.isEmpty || playerTwoName.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(8)
                }
                .disabled(playerOneName.isEmpty || playerTwoName.isEmpty)
            }
            .padding()
        }
        .navigationTitle("Welcome")
    }
}

#Preview {
    MainMenuView()
}
