//
//  GameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Cedric on 30/09/2019.
//  Copyright © 2019 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class GameTestCase: XCTestCase {
    var game: Game!

    override func setUp() {
        super.setUp()
        game = Game()
    }

    func setPlayerScore(_ scores: Int) {
        game.scores[.one]! = scores
    }

    func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {
//        When
        game.incrementScore(forPlayer: .one)
//        Then
        XCTAssert(game.scores[.one]! == 15)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsFifteen_WhenIncrementPlayer1Score_ThenScoreShouldBeThirty() {
//        G
        setPlayerScore(15)
//        W
        game.incrementScore(forPlayer: .one)
//        T
        XCTAssert(game.scores[.one]! == 30)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsThirty_WhenIncrementPlayer1Score_ThenScoreShouldBeForty() {
        //        G
        setPlayerScore(30)
        //        W
        game.incrementScore(forPlayer: .one)
        //        T
        XCTAssert(game.scores[.one]! == 40)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsForty_WhenIncrementPlayer1Score_ThenPlayer1ShouldBeWinner() {
//        G
        setPlayerScore(40)
//        W
        game.incrementScore(forPlayer: .one)
//        T
        XCTAssertEqual(game.winner, .one)
        XCTAssertTrue(game.isOver)
    }
}
