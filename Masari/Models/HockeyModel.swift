//
//  HockeyModel.swift
//  Masari
//
//  Created by Hamza Shahbaz on 03/05/2021.
//

import Foundation

// MARK: - HockeyModel
class HockeyModel: Codable {
    let hockeyModelGet: String?
    let parameters: HParameters?
    let results: Int?
    let response: [HResponse]?

    enum CodingKeys: String, CodingKey {
        case hockeyModelGet = "get"
        case parameters, results, response
    }

    init(hockeyModelGet: String?, parameters: HParameters?, results: Int?, response: [HResponse]?) {
        self.hockeyModelGet = hockeyModelGet
        self.parameters = parameters
        self.results = results
        self.response = response
    }
}

// MARK: - Parameters
class HParameters: Codable {
    let date: String?

    init(date: String?) {
        self.date = date
    }
}

// MARK: - Response
class HResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Double?
    let timezone: String?
    let status: HStatus?
    let country: HCountry?
    let league: HLeague?
    let teams: BTeams?
    let score: HScores?
    let periods: HPeriods?
    let events: Bool?

    init(id: Int?, date: String?, time: String?, timestamp: Double?, timezone: String?, status: HStatus?, country: HCountry?, league: HLeague?, teams: BTeams?, score: HScores, periods: HPeriods?, events: Bool?) {
        self.id = id
        self.date = date
        self.time = time
        self.timestamp = timestamp
        self.timezone = timezone
        self.status = status
        self.country = country
        self.league = league
        self.teams = teams
        self.score = score
        self.periods = periods
        self.events = events
    }
}

// MARK: - Country
class HCountry: Codable {
    let id: Int?
    let name, code: String?
    let flag: String?

    init(id: Int?, name: String?, code: String?, flag: String?) {
        self.id = id
        self.name = name
        self.code = code
        self.flag = flag
    }
}

// MARK: - League
class HLeague: Codable {
    let id: Int?
    let name, type: String?
    let logo: String?
    let season: Int?

    init(id: Int?, name: String?, type: String?, logo: String?, season: Int?) {
        self.id = id
        self.name = name
        self.type = type
        self.logo = logo
        self.season = season
    }
}

// MARK: - Periods
class HPeriods: Codable {
    let first, second, third, overtime: String?
    let penalties: String?

    init(first: String?, second: String?, third: String?, overtime: String?, penalties: String?) {
        self.first = first
        self.second = second
        self.third = third
        self.overtime = overtime
        self.penalties = penalties
    }
}

// MARK: - Scores
class HScores: Codable {
    let home, away: Int?

    init(home: Int?, away: Int?) {
        self.home = home
        self.away = away
    }
}
//// MARK: - Away
//class HAway: Codable {
//    let id: Int?
//    let name: String?
//    let logo: String?
//
//    init(id: Int?, name: String?, logo: String?) {
//        self.id = id
//        self.name = name
//        self.logo = logo
//    }
//}

// MARK: - Status
class HStatus: Codable {
    let long, short: String?

    init(long: String?, short: String?) {
        self.long = long
        self.short = short
    }
}
