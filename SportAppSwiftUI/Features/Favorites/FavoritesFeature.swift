//
//  FavoritesFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import ComposableArchitecture
import Foundation

struct FavoritesFeature: ReducerProtocol {

  enum Action {
    case league(id: LeagueFeature.State.ID, action: LeagueFeature.Action)
    case team(id: TeamFeature.State.ID, action: TeamFeature.Action)
  }

  var body: some ReducerProtocol<SportsFeature.State, Action> {
    Reduce { state, action in
      switch action {
      default: return .none
      }
    }.forEach(\.leagues, action: /Action.league(id:action:)) {
      LeagueFeature()
    }
    .forEach(\.teams, action: /Action.team(id:action:)) {
      TeamFeature()
    }
  }
}

extension SportsFeature.State {
  var favoriteTeams: SportTeams {
    teams.filter(\.isFavorite)
  }
  var favoriteLeagues: LeagueFeatureArray {
    leagues.filter(\.isFavorite)
  }
}
