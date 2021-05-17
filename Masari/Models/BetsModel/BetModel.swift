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
    var matchId: String
    var time: Double
    var matchName: String
    var points: Int
    var result: Int
    
    init(betId: String, userId: String, gameId: String, matchId: String, time: Double, matchName: String, points: Int,result: Int) {
        
        self.betId = betId
        self.userId = userId
        self.gameId = gameId
        self.matchId = matchId
        self.time = time
        self.matchName = matchName
        self.points = points
        self.result = result
    }
}
