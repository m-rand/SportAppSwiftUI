//
//  GameFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 04.11.2022.
//

import ComposableArchitecture
import Foundation

struct GameFeature: ReducerProtocol {

  enum Action {
    case favoriteToggle
  }

  func reduce(into state: inout SportInfo, action: Action) -> EffectTask<Action> {
    switch action {
    case .favoriteToggle:
      state.isFavorite.toggle()
      return .none
    }
  }
}
