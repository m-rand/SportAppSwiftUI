//
//  MainTabCoordinator.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 22.12.2022.
//

import ComposableArchitecture
import Foundation
import TCACoordinators

struct MainTabCoordinator: ReducerProtocol {
  enum Action {
    case saved(Coordinator.Action)
  }

  struct State: Equatable {
    static let initialState = State(
      saved: .initialState
    )
    var saved: Coordinator.State
  }

  var body: some ReducerProtocol<State, Action> {
    Scope(state: \.saved, action: /Action.saved) {
      Coordinator()
    }
  }
}

