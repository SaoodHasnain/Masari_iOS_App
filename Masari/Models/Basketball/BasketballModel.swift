//
//  BasketballModel.swift
//  Masari
//
//  Created by Hamza Shahbaz on 04/05/2021.
//

import Foundation


// MARK: - BasketballModel

class BasketballModel: Codable {
    let basketballModelGet: String?
    let parameters: HParameters?
    let results: Int?
    let response: [BResponse]?

    enum CodingKeys: String, CodingKey {
        case basketballModelGet = "get"
        case parameters, results, response
    }

    init(basketballModelGet: String?, parameters: HParameters?, results: Int?, response: [BResponse]?) {
        self.basketballModelGet = basketballModelGet
        self.parameters = parameters
        self.results = results
        self.response = response
    }
}


// MARK: - Response
class BResponse: Codable {
    let id: Double?
    let date: String?
    let time: String?
    let timestamp: Double?
    let timezone: String?
    let status: BKStatus?
    let league: BKLeague?
    let country: BKCountry?
    let teams: BKTeams?
    let scores: BKScores?

    init(id: Double?, date: String?, time: String?, timestamp: Double?, timezone: String?, status: BKStatus?, league: BKLeague?, country: BKCountry?, teams: BKTeams?, scores: BKScores?) {
        self.id = id
        self.date = date
        self.time = time
        self.timestamp = timestamp
        self.timezone = timezone
        self.status = status
        self.league = league
        self.country = country
        self.teams = teams
        self.scores = scores
    }
}

// MARK: - Country
class BKCountry: Codable {
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
class BKLeague: Codable {
    let id: Int?
    let name, type: String?
    let logo: String?

    init(id: Int?, name: String?, type: String?, logo: String?) {
        self.id = id
        self.name = name
        self.type = type
//        self.season = season
        self.logo = logo
    }
}

// MARK: - Scores
class BKScores: Codable {
    let home, away: BScoresAway?

    init(home: BScoresAway?, away: BScoresAway?) {
        self.home = home
        self.away = away
    }
}

// MARK: - ScoresAway
class BScoresAway: Codable {
    let quarter1, quarter2, quarter3, quarter4: Int?
    let overTime: Int?
    let total: Int?

    enum CodingKeys: String, CodingKey {
        case quarter1 = "quarter_1"
        case quarter2 = "quarter_2"
        case quarter3 = "quarter_3"
        case quarter4 = "quarter_4"
        case overTime = "over_time"
        case total
    }

    init(quarter1: Int?, quarter2: Int?, quarter3: Int?, quarter4: Int?, overTime: Int?, total: Int?) {
        self.quarter1 = quarter1
        self.quarter2 = quarter2
        self.quarter3 = quarter3
        self.quarter4 = quarter4
        self.overTime = overTime
        self.total = total
    }
}

// MARK: - Status
class BKStatus: Codable {
    let long, short, timer: String?

    init(long: String?, short: String?, timer: String?) {
        self.long = long
        self.short = short
        self.timer = timer
    }
}

// MARK: - Teams
class BKTeams: Codable {
    let home, away: BTeamsAway?

    init(home: BTeamsAway?, away: BTeamsAway?) {
        self.home = home
        self.away = away
    }
}

// MARK: - TeamsAway
class BTeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?

    init(id: Int?, name: String?, logo: String?) {
        self.id = id
        self.name = name
        self.logo = logo
    }
}
