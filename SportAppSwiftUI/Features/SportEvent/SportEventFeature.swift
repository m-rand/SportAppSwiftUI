//
//  SportEventFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 03.11.2022.
//

import ComposableArchitecture
import Foundation

struct SportEventFeature: ReducerProtocol {

  enum Action {
    case changeStatus(GameStatus)
    case remindToggle
  }

  func reduce(into state: inout SportEvent, action: Action) -> EffectTask<Action> {
    switch action {
    case let .changeStatus(status):
      state.status = status
      return .none
    case .remindToggle:
      state.remind.toggle()
      return .none
    }
  }
}
