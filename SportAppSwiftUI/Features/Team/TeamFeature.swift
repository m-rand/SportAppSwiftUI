//
//  TeamFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 07.11.2022.
//

import Foundation

import ComposableArchitecture
import Foundation

struct TeamFeature: ReducerProtocol {

  enum Action {
    case favorite(FavoritingAction)
  }

  var body: some ReducerProtocol<SportTeamInfo, Action> {
    Scope(state: \.favorite, action: /Action.favorite) {
      Favoriting()
    }
  }
}

extension SportTeamInfo {
  var favorite: FavoritingState<ID> {
    get { .init(id: self.id, isFavorite: self.isFavorite) }
    set { self.isFavorite = newValue.isFavorite }
  }
}
