//
//  HockeyMatchDetailModel.swift
//  Masari
//
//  Created by Hamza Shahbaz on 04/05/2021.
//

import Foundation

// MARK: - HockeyMatchDetailModel
class HockeyMatchDetailModel: Codable {
    
    let hockeyMatchDetailModelGet: String?
    let parameters: HDParameters?
    let results: Int?
    let response: [HDResponse]?

    enum CodingKeys: String, CodingKey {
        case hockeyMatchDetailModelGet = "get"
        case parameters, results, response
    }

    init(hockeyMatchDetailModelGet: String?, parameters: HDParameters?, results: Int?, response: [HDResponse]?) {
        self.hockeyMatchDetailModelGet = hockeyMatchDetailModelGet
        self.parameters = parameters
        self.results = results
        self.response = response
    }
}

// MARK: - Parameters
class HDParameters: Codable {
    let game: String?

    init(game: String?) {
        self.game = game
    }
}

// MARK: - Response
class HDResponse: Codable {
    let gameID: Int?
    let period, minute: String?
    let team: Team?
    let players, assists: [String]?
    let comment, type: String?

    enum CodingKeys: String, CodingKey {
        case gameID = "game_id"
        case period, minute, team, players, assists, comment, type
    }

    init(gameID: Int?, period: String?, minute: String?, team: Team?, players: [String]?, assists: [String]?, comment: String?, type: String?) {
        self.gameID = gameID
        self.period = period
        self.minute = minute
        self.team = team
        self.players = players
        self.assists = assists
        self.comment = comment
        self.type = type
    }
}

// MARK: - Team
class Team: Codable {
    let id: Int?
    let name: String?
    let logo: String?

    init(id: Int?, name: String?, logo: String?) {
        self.id = id
        self.name = name
        self.logo = logo
    }
}
