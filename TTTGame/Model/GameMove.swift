//
//  GameMove.swift
//  TTTGame
//
//  Created by David Kababyan on 30/04/2023.
//

import Foundation

struct GameMove: Codable {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        player == .player1 ? "xmark" : "circle"
    }
}
