//
//  LeaguesModel.swift
//  Masari
//
//  Created by Hamza Shahbaz on 22/04/2021.
//

import UIKit

// MARK: - LeaguesModel
class LeaguesModel: Codable {
    let leaguesModelGet: String?
    let parameters: Parameter?
    let errors: [String]?
    let results: Int?
    let paging: Paging?
    let response: [Response]?

    enum CodingKeys: String, CodingKey {
        case leaguesModelGet = "get"
        case parameters, errors, results, paging, response
    }

    init(leaguesModelGet: String?, parameters: Parameter?, errors: [String]?, results: Int?, paging: Paging?, response: [Response]?) {
        self.leaguesModelGet = leaguesModelGet
        self.parameters = parameters
        self.errors = errors
        self.results = results
        self.paging = paging
        self.response = response
    }
}

// MARK: - Country
class Country: Codable {
    let name: String?
    let code: String?
    let flag: String?

    init(name: String?, code: String?, flag: String?) {
        self.name = name
        self.code = code
        self.flag = flag
    }
}


enum TypeEnum: String, Codable {
    case cup = "Cup"
    case league = "League"
}

// MARK: - Season
class Season: Codable {
    let year: Int?
    let start, end: String?
    let current: Bool?
    let coverage: Coverage?

    init(year: Int?, start: String?, end: String?, current: Bool?, coverage: Coverage?) {
        self.year = year
        self.start = start
        self.end = end
        self.current = current
        self.coverage = coverage
    }
}

// MARK: - Coverage
class Coverage: Codable {
    let fixtures: Fixtures?
    let standings, players, topScorers, topAssists: Bool?
    let topCards, predictions, odds: Bool?

    enum CodingKeys: String, CodingKey {
        case fixtures, standings, players
        case topScorers = "top_scorers"
        case topAssists = "top_assists"
        case topCards = "top_cards"
        case predictions, odds
    }

    init(fixtures: Fixtures?, standings: Bool?, players: Bool?, topScorers: Bool?, topAssists: Bool?, topCards: Bool?, predictions: Bool?, odds: Bool?) {
        self.fixtures = fixtures
        self.standings = standings
        self.players = players
        self.topScorers = topScorers
        self.topAssists = topAssists
        self.topCards = topCards
        self.predictions = predictions
        self.odds = odds
    }
}

// MARK: - Fixtures
class Fixtures: Codable {
    let events, lineups, statisticsFixtures, statisticsPlayers: Bool?

    enum CodingKeys: String, CodingKey {
        case events, lineups
        case statisticsFixtures = "statistics_fixtures"
        case statisticsPlayers = "statistics_players"
    }

    init(events: Bool?, lineups: Bool?, statisticsFixtures: Bool?, statisticsPlayers: Bool?) {
        self.events = events
        self.lineups = lineups
        self.statisticsFixtures = statisticsFixtures
        self.statisticsPlayers = statisticsPlayers
    }
}

