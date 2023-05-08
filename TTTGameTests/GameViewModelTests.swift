//
//  TTTGameTests.swift
//  TTTGameTests
//
//  Created by David Kababyan on 29/04/2023.
//

import XCTest
@testable import TTTGame

final class TTTGameTests: XCTestCase {

    var sut = GameViewModel(with: .vsHuman, onlineGameRepository: OnlineGameRepository())
    
    func test_ResetGameSetsTheActivePlayerToPlayer1() {
        sut.resetGame()
        XCTAssertEqual(sut.activePlayer, .player1)
    }
    
    func test_ResetGameSetsMovesToNineNilObjects() {
        sut.resetGame()
        XCTAssertEqual(sut.moves.count, 9)
    }
    
    func test_ResetGameSetsGameNotificationToP1Turn() {
        sut.resetGame()
        XCTAssertEqual(sut.gameNotification, "It's \(sut.activePlayer.name)'s move")
    }
    
    func test_ProcessMovesWillShowFinishAlert() {
        
        for index in 0..<9 {
            sut.processMove(for: index)
        }
        
        XCTAssertEqual(sut.gameNotification, AppStrings.gameHasFinished)
    }
    
    func test_ProcessMovesWillReturnForOccupiedSquare() {
        sut.processMove(for: 0)
        sut.processMove(for: 0)
        
        XCTAssertEqual(sut.moves.compactMap {$0}.count, 1)
    }
    
    
    func test_Player1WinWillIncreaseTheScore() {
        XCTAssertEqual(sut.player1Score, 0)
        player1WillWin()
        XCTAssertEqual(sut.player1Score, 1)
    }

    func test_Player2WinWillIncreaseTheScore() {
        XCTAssertEqual(sut.player2Score, 0)
        player2WillWin()
        XCTAssertEqual(sut.player2Score, 1)
    }
    
    
    func test_DrawWillShowNotification() {
        produceDraw()
        XCTAssertEqual(sut.gameNotification, GameState.draw.name)
    }
    
    func test_CPUWillTakeTheMiddleSpot() {
        let expectation = expectation(description: "Waiting for CPU move")
        
        sut = GameViewModel(with: .vsCPU, onlineGameRepository: OnlineGameRepository())
        
        sut.processMove(for: 0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            XCTAssertNotNil(self.sut.moves[4])
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.1)
    }
    
    func player1WillWin() {
        sut.processMove(for: 0)//P1
        sut.processMove(for: 2)//P2
        sut.processMove(for: 3)//P1
        sut.processMove(for: 5)//P2
        sut.processMove(for: 6)//P1
    }
    
    func player2WillWin() {
        sut.processMove(for: 2)//P1
        sut.processMove(for: 0)//P2
        sut.processMove(for: 5)//P1
        sut.processMove(for: 3)//P2
        sut.processMove(for: 4)//P1
        sut.processMove(for: 6)//P2
    }
    
    func produceDraw() {
        sut.processMove(for: 0)
        sut.processMove(for: 4)
        sut.processMove(for: 2)
        sut.processMove(for: 1)
        sut.processMove(for: 7)
        sut.processMove(for: 3)
        sut.processMove(for: 5)
        sut.processMove(for: 8)
        sut.processMove(for: 6)
    }


}
