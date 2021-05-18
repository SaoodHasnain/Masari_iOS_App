//
//  BetModel.swift
//  Masari
//
//  Created by Hamza Shahbaz on 17/05/2021.
//

import Foundation


class BetModel {
    
    var betId: String
    var userId: String
    var gameId: String
    var sportId: String
    var matchId: String
    var isBetOn: Bool
    var time: Double
    var matchName: String
    var points: Int
    var result: Int
    
    init(betId: String, userId: String, gameId: String, matchId: String, sportId: String, isBetOn: Bool , time: Double, matchName: String, points: Int,result: Int) {
        
        self.betId = betId
        self.userId = userId
        self.gameId = gameId
        self.matchId = matchId
        self.sportId = sportId
        self.isBetOn = isBetOn
        self.time = time
        self.matchName = matchName
        self.points = points
        self.result = result
    }
}
