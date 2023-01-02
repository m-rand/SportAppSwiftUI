//
//  Model.swift
//  SportApp
//
//  Created by Marcel Balas on 01.11.2022.
//

import IdentifiedCollections
import Foundation
import UIKit

struct SportAppModel: Equatable {
  var user: User
  var news: News
  var onlines: Onlines
  var sports: Sports
}

struct News: Equatable {
  var articles: IdentifiedArrayOf<Article>
}

struct Onlines: Equatable {
  var events: IdentifiedArrayOf<SportEventFeature.State>

  var todayEvents: IdentifiedArrayOf<SportEventFeature.State> {
    events.filter { Calendar.current.isDateInToday($0.date) }
  }

  var tomorrowEvents: IdentifiedArrayOf<SportEventFeature.State> {
    events.filter { Calendar.current.isDateInTomorrow($0.date) }
  }
}

struct Sports: Equatable {
  var teams: IdentifiedArrayOf<SportTeamInfo>
  var leagues: IdentifiedArrayOf<SportLeagueInfo>
  var athletes: IdentifiedArrayOf<Athlete>
  var games: IdentifiedArrayOf<SportInfo>
}

// MARK: - User profile
struct User: Equatable {
  var userId: Int
  var name: String
  var avatar: URL?
  var subscriptions: [SportSubscription]
}

// MARK: - News

// News article
struct Article: Equatable, Identifiable {
  var id: Int
  var headline: String
  var image: URL?
  var publishDate: Date
  var authors: [String]
  var sport: SportGame
  var league: SportLeague?
  var text: String
  var liked: Bool
  var likes: Int
}

// MARK: - Sport game definitions

enum SportGame: String, Equatable, Identifiable {
  var id: Self { self }
  case football = "Football"
  case formule1 = "Formula 1"
  case motoGp = "Moto GP"
  case tennis = "Tennis"
  case biathlon = "Biathlon"
  case mma = "MMA"
  case climbing = "Climbing"
  case hockey = "Hockey"
}

enum SportGameInfo: Equatable {
  case football(FootballGameInfo)
  case tennis(TennisGameInfo)
}

struct SportInfo: Equatable, Identifiable {
  var id: UUID
  var isFavorite: Bool
  var sport: SportGame
  var name: String
  var image: URL?
  var leagueIDs: [UUID]
}

// MARK: - Sport team definitions

enum SportTeam: Equatable, Identifiable {
  var id: Int {
    switch self {
    case let .football(footballTeam):
      return footballTeam.id
    }
  }
  case football(FootballTeam)
}

struct SportTeamInfo: Equatable, Identifiable {
  var id: UUID
  var isFavorite: Bool
  var name: String
  var shortName: String
  var country: String
  var image: URL?
  var players: [Athlete]
}

// MARK: - Sport league definitions

enum SportLeague: String, Equatable {
  case fortuna
  case rolandGarros
  case nhl
  case premierLeague
  case uefaChampLeague // liga mistrů
}

struct SportLeagueInfo: Equatable, Identifiable {
  var id: UUID
  var isFavorite: Bool
  var name: String
  var image: URL?
}

// MARK: - Sport event / Online

// Single sport event / match
struct SportEvent: Equatable, Identifiable {
  var id: Int
  var gameInfo: SportGameInfo
  var date: Date
  var duration: TimeInterval
  var status: GameStatus
  var league: SportLeague
  var result: String
  var remind: Bool = false

  var isOnline: Bool {
    if case .match = status { return true } else { return false }
  }
}

enum GameStatus: Equatable {
  case before
  case match(time: TimeInterval)
  case extensionTime
  case finished
  case postponed
}

// MARK: - Football game definition

struct FootballTeam: Equatable {
  var id: Int
  var name: String
  var shortName: String
  var country: String
  var logo: URL?
  var players: [Athlete]
}

struct FootballGameInfo: Equatable {
  var team1: SportTeamInfo
  var team2: SportTeamInfo
}

// MARK: - Tennis game definition

struct SingleTennisGameInfo: Equatable {
  var player1: Athlete
  var player2: Athlete
}

struct DoubleTennisGameInfo: Equatable {
  var player1: Athlete
  var player2: Athlete
  var player3: Athlete
  var player4: Athlete
}

enum TennisGameInfo: Equatable {
  case single(SingleTennisGameInfo)
  case double(DoubleTennisGameInfo)
}

// MARK: - Athlete

struct Athlete: Equatable, Identifiable {
  var id: Int
  var name: String
  var age: Int
  var sex: Sex
  var nationality: Nationality
  var profileImage: URL?
  var images: [URL]
  var sports: [SportGame]
  var isFavorite: Bool
}

// MARK: - Helper definitions

enum Nationality: Equatable {
  case czech
  case canadian
  case spanish
}

enum Sex: Equatable {
  case male
  case female
}

enum SportSubscription: Equatable {
  case team(SportTeam)
  case sportGame(SportGame)
  case athlete(Athlete)
  case league(SportLeague)
}

