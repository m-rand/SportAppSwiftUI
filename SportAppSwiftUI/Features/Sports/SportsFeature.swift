//
//  SportsFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import ComposableArchitecture
import Foundation

struct SportsFeature: ReducerProtocol {
  struct State: Equatable {
    var teams: IdentifiedArrayOf<SportTeamInfo>
    var leagues: IdentifiedArrayOf<SportLeagueInfo>
    var athletes: IdentifiedArrayOf<Athlete>
    var games: IdentifiedArrayOf<SportInfo>
  }

  enum Action {
    case league(id: LeagueFeature.State.ID, action: LeagueFeature.Action)
    case game(id: GameFeature.State.ID, action: GameFeature.Action)
    case team(id: TeamFeature.State.ID, action: TeamFeature.Action)
  }

  var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      default: return .none
      }
    }
    .forEach(\.leagues, action: /Action.league(id:action:)) {
      LeagueFeature()
    }
    .forEach(\.games, action: /Action.game(id:action:)) {
      GameFeature()
    }
    .forEach(\.teams, action: /Action.team(id:action:)) {
      TeamFeature()
    }
  }
}
