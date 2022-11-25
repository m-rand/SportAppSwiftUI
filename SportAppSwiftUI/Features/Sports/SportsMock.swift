//
//  SportsMock.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 07.11.2022.
//

import IdentifiedCollections
import Foundation

// typealiases just so as we can extend the whole array as a type
typealias LeagueFeatureArray = IdentifiedArrayOf<LeagueFeature.State>
typealias SportTeams = IdentifiedArrayOf<SportTeamInfo>
typealias SportAthletes = IdentifiedArrayOf<Athlete>
typealias SportGames = IdentifiedArrayOf<SportInfo>

extension SportsFeature.State {
  static let mock = SportsFeature.State(
    teams: .mock,
    leagues: .mock,
    athletes: .mock,
    games: .mock
  )
}

extension LeagueFeatureArray {
  static let mock = LeagueFeatureArray(uniqueElements: [
    LeagueFeature.State(
      id: UUID(),
      isFavorite: true,
      name: "Roland Garros",
      image: URL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/1/1d/Logo_Roland-Garros.svg/1920px-Logo_Roland-Garros.svg.png")
    ),
    LeagueFeature.State(
      id: UUID(),
      isFavorite: true,
      name: "NHL",
      image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/National_Hockey_League_shield.svg/1920px-National_Hockey_League_shield.svg.png")
    ),
    LeagueFeature.State(
      id: UUID(),
      isFavorite: false,
      name: "Premier League",
      image: URL(string: "https://b.fssta.com/uploads/application/soccer/competition-logos/EnglishPremierLeague.png")
    ),
    LeagueFeature.State(
      id: UUID(),
      isFavorite: false,
      name: "UEFA Champ League",
      image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/UEFA_Champions_League.svg/1920px-UEFA_Champions_League.svg.png")
    ),
    LeagueFeature.State(
      id: UUID(),
      isFavorite: false,
      name: "Fortuna Liga",
      image: URL(string: "https://sportzoo.s15.cdn-upgates.com/_cache/1/8/18c097ee66ce2adec5e6148891a00908.png")
    ),
  ])
}

extension SportTeams {
  static let mock: Self = { IdentifiedArray(uniqueElements: [
    SportTeamInfo(
      id: UUID(),
      isFavorite: false,
      name: "Arsenal",
      shortName: "ARS",
      country: "England",
      image: URL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/5/53/Arsenal_FC.svg/1280px-Arsenal_FC.svg.png"),
      players: []
    ),
    SportTeamInfo(
      id: UUID(),
      isFavorite: true,
      name: "Chelsea",
      shortName: "CHE",
      country: "England",
      image: URL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/1920px-Chelsea_FC.svg.png"),
      players: []
    ),
    SportTeamInfo(
      id: UUID(),
      isFavorite: true,
      name: "FC Barcelona",
      shortName: "BAR",
      country: "Spain",
      image: URL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/1920px-FC_Barcelona_%28crest%29.svg.png"),
      players: []
    ),
    SportTeamInfo(
      id: UUID(),
      isFavorite: true,
      name: "SK Slavia Praha",
      shortName: "SLA",
      country: "Czechia",
      image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/9/90/Slavia-symbol-nowordmark-RGB.png"),
      players: []
    ),
  ]
  )}()
}

extension SportAthletes {
  static let mock: Self = { IdentifiedArrayOf<Athlete>(uniqueElements: [
    Athlete(id: 1, name: "Felix Auger Aliassime", age: 29, sex: .male, nationality: .canadian, images: [], sports: [.tennis], isFavorite: true),
    Athlete(id: 2, name: "Alejandro Davidovich Fokina", age: 27, sex: .male, nationality: .spanish, images: [], sports: [.tennis], isFavorite: false)
  ])}()
}

extension SportGames {
  static let mock: Self = { IdentifiedArrayOf<SportInfo>(uniqueElements: [
    SportInfo(
      id: UUID(),
      isFavorite: true,
      sport: .football,
      name: "Football",
      image: nil,
      leagueIDs: [LeagueFeatureArray.mock[3].id]
    ),
    SportInfo(
      id: UUID(),
      isFavorite: true,
      sport: .tennis,
      name: "Tennis",
      image: nil,
      leagueIDs: []
    ),
    SportInfo(
      id: UUID(),
      isFavorite: true,
      sport: .biathlon,
      name: "Biathlon",
      image: nil,
      leagueIDs: []
    ),
    SportInfo(
      id: UUID(),
      isFavorite: false,
      sport: .mma,
      name: "MMA",
      image: nil,
      leagueIDs: []
    ),
    SportInfo(
      id: UUID(),
      isFavorite: false,
      sport: .climbing,
      name: "Climbing",
      image: nil,
      leagueIDs: []
    ),
    SportInfo(
      id: UUID(),
      isFavorite: false,
      sport: .motoGp,
      name: "MotoGP",
      image: nil,
      leagueIDs: []
    ),
  ])}()
}
