//
//  TicTacToeGame.swift
//  Tic Tac Tremendous
//
//  Created by Dragomir Mindrescu on 13.04.2024.
//

import Foundation

class TicTacToeGame: ObservableObject {
    @Published var board: [String] = Array(repeating: "", count: 9)
    @Published var currentPlayer: String = "X"
    @Published var gameStatus: String = "Player X's turn"
    @Published var isGameActive: Bool = true

    func tapSquare(index: Int) {
        if board[index] == "" && isGameActive {
            board[index] = currentPlayer
            if checkWin(player: currentPlayer) {
                gameStatus = "Player \(currentPlayer) wins!"
                isGameActive = false
            } else if board.allSatisfy({ $0 != "" }) {
                gameStatus = "Game Draw"
                isGameActive = false
            } else {
                currentPlayer = currentPlayer == "X" ? "O" : "X"
                gameStatus = "Player \(currentPlayer)'s turn"
            }
        }
    }

    func checkWin(player: String) -> Bool {
        let winPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]
        return winPatterns.contains { pattern in
            pattern.allSatisfy { index in board[index] == player }
        }
    }

    func resetGame() {
        board = Array(repeating: "", count: 9)
        currentPlayer = "X"
        gameStatus = "Player X's turn"
        isGameActive = true
    }
}

