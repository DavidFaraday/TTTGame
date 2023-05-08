//
//  Game.swift
//  TTTGame
//
//  Created by David Kababyan on 01/05/2023.
//

import Foundation

struct Game: Codable, Identifiable {
    let id: String
    
    var player1Id: String
    var player2Id: String
    
    var player1Score: Int
    var player2Score: Int
    
    var activePlayerId: String
    var winningPlayerId: String
    
    var moves: [GameMove?]
}
