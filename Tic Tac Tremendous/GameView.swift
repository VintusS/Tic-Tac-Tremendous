//
//  GameView.swift
//  Tic Tac Tremendous
//
//  Created by Dragomir Mindrescu on 13.04.2024.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var game = TicTacToeGame()
    var playerOneName: String
    var playerTwoName: String

    var body: some View {
        VStack(spacing: 10) {
            Text(game.gameStatus)
                .font(.headline)
                .padding()

            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(0..<9) { index in
                    ZStack {
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                            .shadow(radius: 5)

                        Text(game.board[index])
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .onTapGesture {
                        game.tapSquare(index: index)
                    }
                }
            }
            .padding()

            Button("New Game") {
                game.resetGame()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}



#Preview {
    GameView(playerOneName: "Alice", playerTwoName: "Bob")
}
