//
//  LiveMatchDetailModel.swift
//  Masari
//
//  Created by Hamza Shahbaz on 29/04/2021.
//

import Foundation

// MARK: - LiveMatchDetailModel

class LiveMatchDetailModel: Codable {
    
    let liveMatchDetailModelGet: String?
    
    let parameters: Parameter?
    let results: Int?
    let paging: Paging?
    let response: [Response]?

    enum CodingKeys: String, CodingKey {
        case liveMatchDetailModelGet = "get"
        case parameters, results, paging, response
    }

    init(liveMatchDetailModelGet: String?, parameters: Parameter?, results: Int?, paging: Paging?, response: [Response]?) {
        self.liveMatchDetailModelGet = liveMatchDetailModelGet
        self.parameters = parameters
        self.results = results
        self.paging = paging
        self.response = response
    }
}

// MARK: - Lineup
class Lineup: Codable {
    let team: Away?
    let formation: String?
    let startXI, substitutes: [StartXi]?
    let coach: Coach?

    init(team: Away?, formation: String?, startXI: [StartXi]?, substitutes: [StartXi]?, coach: Coach?) {
        self.team = team
        self.formation = formation
        self.startXI = startXI
        self.substitutes = substitutes
        self.coach = coach
    }
}

// MARK: - Coach
class Coach: Codable {
    let id: Int?
    let name: String?
    let photo: String?

    init(id: Int?, name: String?, photo: String?) {
        self.id = id
        self.name = name
        self.photo = photo
    }
}

// MARK: - StartXi
class StartXi: Codable {
    let player: StartXIPlayer?

    init(player: StartXIPlayer?) {
        self.player = player
    }
}

// MARK: - StartXIPlayer
class StartXIPlayer: Codable {
    let id: Int?
    let name: String?
    let number: Int?
    let pos: Pos?

    init(id: Int?, name: String?, number: Int?, pos: Pos?) {
        self.id = id
        self.name = name
        self.number = number
        self.pos = pos
    }
}

enum Pos: String, Codable {
    case d = "D"
    case f = "F"
    case g = "G"
    case m = "M"
}

// MARK: - ResponsePlayer
class ResponsePlayer: Codable {
    let team: Away?
    let players: [PlayerPlayer]?

    init(team: Away?, players: [PlayerPlayer]?) {
        self.team = team
        self.players = players
    }
}

// MARK: - PlayerPlayer
class PlayerPlayer: Codable {
    let player: Coach?
    let statistics: [PlayerStatistic]?

    init(player: Coach?, statistics: [PlayerStatistic]?) {
        self.player = player
        self.statistics = statistics
    }
}

// MARK: - PlayerStatistic
class PlayerStatistic: Codable {
    let games: Games?
    let shots: Shots?
    let goals: StatisticGoals?
    let passes: Passes?
    let tackles: Tackles?
    let duels: Duels?
    let dribbles: Dribbles?
    let fouls: Fouls?
    let cards: Cards?
    let penalty: Penalty?
    let offsides: String?

    init(games: Games?, shots: Shots?, goals: StatisticGoals?, passes: Passes?, tackles: Tackles?, duels: Duels?, dribbles: Dribbles?, fouls: Fouls?, cards: Cards?, penalty: Penalty?, offsides: String?) {
        self.games = games
        self.shots = shots
        self.goals = goals
        self.passes = passes
        self.tackles = tackles
        self.duels = duels
        self.dribbles = dribbles
        self.fouls = fouls
        self.cards = cards
        self.penalty = penalty
        self.offsides = offsides
    }
}

// MARK: - Cards
class Cards: Codable {
    let yellow, red: Int?

    init(yellow: Int?, red: Int?) {
        self.yellow = yellow
        self.red = red
    }
}

// MARK: - Dribbles
class Dribbles: Codable {
    let attempts, success, past: Int?

    init(attempts: Int?, success: Int?, past: Int?) {
        self.attempts = attempts
        self.success = success
        self.past = past
    }
}

// MARK: - Duels
class Duels: Codable {
    let total, won: Int?

    init(total: Int?, won: Int?) {
        self.total = total
        self.won = won
    }
}

// MARK: - Fouls
class Fouls: Codable {
    let drawn, committed: Int?

    init(drawn: Int?, committed: Int?) {
        self.drawn = drawn
        self.committed = committed
    }
}

// MARK: - Games
class Games: Codable {
    let minutes: Int?
    let number: Int?
    let position: Pos?
    let rating: String?
    let captain, substitute: Bool?

    init(minutes: Int?, number: Int?, position: Pos?, rating: String?, captain: Bool?, substitute: Bool?) {
        self.minutes = minutes
        self.number = number
        self.position = position
        self.rating = rating
        self.captain = captain
        self.substitute = substitute
    }
}

// MARK: - StatisticGoals
class StatisticGoals: Codable {
    let total: Int?
    let conceded: Int?
    let assists, saves: Int?

    init(total: Int?, conceded: Int?, assists: Int?, saves: Int?) {
        self.total = total
        self.conceded = conceded
        self.assists = assists
        self.saves = saves
    }
}

// MARK: - Passes
class Passes: Codable {
    let total, key: Int?
    let accuracy: String?

    init(total: Int?, key: Int?, accuracy: String?) {
        self.total = total
        self.key = key
        self.accuracy = accuracy
    }
}

// MARK: - Penalty
class Penalty: Codable {
    let won, commited: Int?
    let scored, missed: Int?
    let saved: Int?

    init(won: Int?, commited: Int?, scored: Int?, missed: Int?, saved: Int?) {
        self.won = won
        self.commited = commited
        self.scored = scored
        self.missed = missed
        self.saved = saved
    }
}

// MARK: - Shots
class Shots: Codable {
    let total, on: Int?

    init(total: Int?, on: Int?) {
        self.total = total
        self.on = on
    }
}

// MARK: - Tackles
class Tackles: Codable {
    let total, blocks, interceptions: Int?

    init(total: Int?, blocks: Int?, interceptions: Int?) {
        self.total = total
        self.blocks = blocks
        self.interceptions = interceptions
    }
}


