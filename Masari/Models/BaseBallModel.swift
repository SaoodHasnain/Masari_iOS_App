//
//  BaseBallModel.swift
//  Masari
//
//  Created by Hamza Shahbaz on 29/04/2021.
//

import Foundation

// MARK: - BaseBallModel
class BaseBallModel: Codable {
    let baseBallModelGet: String?
    let parameters: BParameters?
    let errors: [String]?
    let results: Int?
    let response: [BaseBAllResponse]?

    enum CodingKeys: String, CodingKey {
        case baseBallModelGet = "get"
        case parameters, errors, results, response
    }

    init(baseBallModelGet: String?, parameters: BParameters?, errors: [String]?, results: Int?, response: [BaseBAllResponse]?) {
        self.baseBallModelGet = baseBallModelGet
        self.parameters = parameters
        self.errors = errors
        self.results = results
        self.response = response
    }
}

// MARK: - Parameters
class BParameters: Codable {
    let date: String?

    init(date: String?) {
        self.date = date
    }
}

// MARK: - Response
class BaseBAllResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Double?
    let timezone: Timezone?
//    let week: String?
    let status: BStatus?
    let country: BCountry?
    let league: BLeague?
    let teams: BTeams?
    let scores: Scores?
//        , week: String?

    init(id: Int?, date: String?, time: String?, timestamp: Double?, timezone: Timezone?, status: BStatus?, country: BCountry?, league: BLeague?, teams: BTeams?, scores: Scores?) {
        self.id = id
        self.date = date
        self.time = time
        self.timestamp = timestamp
        self.timezone = timezone
//        self.week = week
        self.status = status
        self.country = country
        self.league = league
        self.teams = teams
        self.scores = scores
    }
}

// MARK: - Country
class BCountry: Codable {
    let id: Int?
    let name: String?
//    let code: Code?
    let flag: String?

    init(id: Int?, name: String?, flag: String?) {
        self.id = id
        self.name = name
//        self.code = code
        self.flag = flag
    }
}

enum Code: String, Codable {
    case jp = "JP"
    case nl = "NL"
    case tw = "TW"
    case us = "US"
}

enum CountryName: String, Codable {
    case japan = "Japan"
    case netherlands = "Netherlands"
    case taiwan = "Taiwan"
    case usa = "USA"
}

// MARK: - League
class BLeague: Codable {
    let id: Int?
    let name: String?
//    let type: TypeEnum?
    let logo: String?
    let season: Int?

    init(id: Int?, name: String?,  logo: String?, season: Int?) {
        self.id = id
        self.name = name
//        self.type = type
        self.logo = logo
        self.season = season
    }
}

//enum LeagueName: String, Codable {
//    case cpbl = "CPBL"
//    case hoofdklasse = "Hoofdklasse"
//    case mlb = "MLB"
//    case npb = "NPB"
//}

//enum TypeEnum: String, Codable {
//    case league = "League"
//}

// MARK: - Scores
class Scores: Codable {
    let home, away: ScoresAway?

    init(home: ScoresAway?, away: ScoresAway?) {
        self.home = home
        self.away = away
    }
}

// MARK: - ScoresAway
class ScoresAway: Codable {
    let hits, errors: Int?
    let innings: Innings?
    let total: Int?

    init(hits: Int?, errors: Int?, innings: Innings?, total: Int?) {
        self.hits = hits
        self.errors = errors
        self.innings = innings
        self.total = total
    }
}

// MARK: - Innings
class Innings: Codable {
    let the1, the2, the3, the4: Int?
    let the5, the6, the7, the8: Int?
    let the9, extra: Int?

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
        case the2 = "2"
        case the3 = "3"
        case the4 = "4"
        case the5 = "5"
        case the6 = "6"
        case the7 = "7"
        case the8 = "8"
        case the9 = "9"
        case extra
    }

    init(the1: Int?, the2: Int?, the3: Int?, the4: Int?, the5: Int?, the6: Int?, the7: Int?, the8: Int?, the9: Int?, extra: Int?) {
        self.the1 = the1
        self.the2 = the2
        self.the3 = the3
        self.the4 = the4
        self.the5 = the5
        self.the6 = the6
        self.the7 = the7
        self.the8 = the8
        self.the9 = the9
        self.extra = extra
    }
}

// MARK: - Status
class BStatus: Codable {
    let long: String?
    let short: String?

    init(long: String?, short: String?) {
        self.long = long
        self.short = short
    }
}

//enum Long: String, Codable {
//    case finished = "Finished"
//    case postponed = "Postponed"
//}
//
//enum Short: String, Codable {
//    case ft = "FT"
//    case post = "POST"
//}

// MARK: - Teams
class BTeams: Codable {
    let home, away: TeamsAway?

    init(home: TeamsAway?, away: TeamsAway?) {
        self.home = home
        self.away = away
    }
}

// MARK: - TeamsAway
class TeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?

    init(id: Int?, name: String?, logo: String?) {
        self.id = id
        self.name = name
        self.logo = logo
    }
}

enum Timezone: String, Codable {
    case utc = "UTC"
}
