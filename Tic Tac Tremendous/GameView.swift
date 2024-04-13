//
//  GameView.swift
//  Tic Tac Tremendous
//
//  Created by Dragomir Mindrescu on 13.04.2024.
//

import SwiftUI

struct GameView: View {
    var playerOneName: String
    var playerTwoName: String

    var body: some View {
        Text("Game between \(playerOneName) and \(playerTwoName)")
    }
}


#Preview {
    GameView(playerOneName: "Alice", playerTwoName: "Bob")
}
