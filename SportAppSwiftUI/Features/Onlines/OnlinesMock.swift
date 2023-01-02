//
//  OnlinesMock.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 07.11.2022.
//

import IdentifiedCollections
import Foundation

extension Onlines {
  static let mock = OnlinesFeature.State(events: IdentifiedArrayOf<SportEvent>(uniqueElements: [
    SportEvent(
      id: 1,
      gameInfo: .football(
        FootballGameInfo(
          team1: SportTeams.mock[0],
          team2: SportTeams.mock[1]
        )
      ),
      date: Date(),
      duration: 59*60,
      status: .match(time: 59*60),
      league: .premierLeague,
      result: "2:1"
    ),
    SportEvent(
      id: 2,
      gameInfo: .tennis(.single(SingleTennisGameInfo(
        player1: SportAthletes.mock[id: 1]!,
        player2: SportAthletes.mock[id: 2]!
      ))),
      date: Date(),
      duration: 97*60,
      status: .match(time: 97*60),
      league: .rolandGarros,
      result: "6:7, 6:3, 6:4"
    ),
    SportEvent(
      id: 3,
      gameInfo: .football(
        FootballGameInfo(
          team1: SportTeams.mock[2],
          team2: SportTeams.mock[3]
        )
      ),
      date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
      duration: 90,
      status: .before,
      league: .uefaChampLeague,
      result: ""
    ),
  ]))
}
