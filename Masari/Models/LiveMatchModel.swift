//
//  LiveMatchModel.swift
//  Masari
//
//  Created by Hamza Shahbaz on 21/04/2021.
//

import Foundation


// MARK: - LiveMatchModel
class FootballModel: Codable {
    let FootballModel: String?
    let parameters: Parameter?
    let results: Int?
    let paging: Paging?
    let response: [Response]?

    enum CodingKeys: String, CodingKey {
        case FootballModel = "get"
        case parameters, results, paging, response
    }

    init(FootballModel: String?, parameters: Parameter?, results: Int?, paging: Paging?, response: [Response]?) {
        self.FootballModel = FootballModel
        self.parameters = parameters
        self.results = results
        self.paging = paging
        self.response = response
    }
}

// MARK: - Paging
class Paging: Codable {
    let current, total: Int?

    init(current: Int?, total: Int?) {
        self.current = current
        self.total = total
    }
}

// MARK: - Parameters
class Parameter: Codable {
    let live: String?

    init(live: String?) {
        self.live = live
    }
}

// MARK: - Response
class Response: Codable {
    let fixture: Fixture?
    let league: League?
    let teams: Teams?
    let goals: Goals?
    let score: Score?
    let events: [Event]?

    init(fixture: Fixture?, league: League?, teams: Teams?, goals: Goals?, score: Score?, events: [Event]?) {
        self.fixture = fixture
        self.league = league
        self.teams = teams
        self.goals = goals
        self.score = score
        self.events = events
    }
}

// MARK: - Event
class Event: Codable {
    let time: Time?
    let team: Away?
    let player, assist: Assist?
    let type, detail: String?
    let comments: String?

    init(time: Time?, team: Away?, player: Assist?, assist: Assist?, type: String?, detail: String?, comments: String?) {
        self.time = time
        self.team = team
        self.player = player
        self.assist = assist
        self.type = type
        self.detail = detail
        self.comments = comments
    }
}

// MARK: - Assist
class Assist: Codable {
    let id: Int?
    let name: String?

    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}

// MARK: - Away
class Away: Codable {
    let id: Int?
    let name: String?
    let logo: String?
    let winner: Bool?

    init(id: Int?, name: String?, logo: String?, winner: Bool?) {
        self.id = id
        self.name = name
        self.logo = logo
        self.winner = winner
    }
}

// MARK: - Time
class Time: Codable {
    let elapsed: Int?
    let extra: Int?

    init(elapsed: Int?, extra: Int?) {
        self.elapsed = elapsed
        self.extra = extra
    }
}

// MARK: - Fixture
class Fixture: Codable {
    let id: Int?
    let referee: String?
    let timezone: String?
    let date: String?
    let timestamp: Double?
    let periods: Periods?
    let venue: Venue?
    let status: Status?

    init(id: Int?, referee: String?, timezone: String?, date: String?, timestamp: Double?, periods: Periods?, venue: Venue?, status: Status?) {
        self.id = id
        self.referee = referee
        self.timezone = timezone
        self.date = date
        self.timestamp = timestamp
        self.periods = periods
        self.venue = venue
        self.status = status
    }
}

// MARK: - Periods
class Periods: Codable {
    let first: Int?
    let second: Int?

    init(first: Int?, second: Int?) {
        self.first = first
        self.second = second
    }
}

// MARK: - Status
class Status: Codable {
    let long, short: String?
    let elapsed: Int?

    init(long: String?, short: String?, elapsed: Int?) {
        self.long = long
        self.short = short
        self.elapsed = elapsed
    }
}

// MARK: - Venue
class Venue: Codable {
    let id: Int?
    let name, city: String?

    init(id: Int?, name: String?, city: String?) {
        self.id = id
        self.name = name
        self.city = city
    }
}

// MARK: - Goals
class Goals: Codable {
    let home, away: Int?

    init(home: Int?, away: Int?) {
        self.home = home
        self.away = away
    }
}

// MARK: - League
class League: Codable {
    let id: Int?
    let name, country: String?
    let logo: String?
    let flag: String?
    let season: Int?
    let round: String?

    init(id: Int?, name: String?, country: String?, logo: String?, flag: String?, season: Int?, round: String?) {
        self.id = id
        self.name = name
        self.country = country
        self.logo = logo
        self.flag = flag
        self.season = season
        self.round = round
    }
}

// MARK: - Score
class Score: Codable {
    let halftime, fulltime, extratime, penalty: Goals?

    init(halftime: Goals?, fulltime: Goals?, extratime: Goals?, penalty: Goals?) {
        self.halftime = halftime
        self.fulltime = fulltime
        self.extratime = extratime
        self.penalty = penalty
    }
}

// MARK: - Teams
class Teams: Codable {
    let home, away: Away?

    init(home: Away?, away: Away?) {
        self.home = home
        self.away = away
    }
}
