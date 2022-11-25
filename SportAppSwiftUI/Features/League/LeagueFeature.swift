//
//  LeagueFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 04.11.2022.
//

import ComposableArchitecture
import Foundation

struct LeagueFeature: ReducerProtocol {

  enum Action {
    case favorite(FavoritingAction)
  }

  var body: some ReducerProtocol<SportLeagueInfo, Action> {
    Scope(state: \.favorite, action: /Action.favorite) {
      Favoriting()
    }
  }
}

extension SportLeagueInfo {
  var favorite: FavoritingState<ID> {
    get { .init(id: self.id, isFavorite: self.isFavorite) }
    set { self.isFavorite = newValue.isFavorite }
  }
}
