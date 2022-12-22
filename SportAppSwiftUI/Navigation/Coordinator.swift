//
//  Coordinator.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 22.12.2022.
//

import ComposableArchitecture
import Foundation
import SwiftUI
import TCACoordinators

struct Coordinator: ReducerProtocol {
  struct State: Equatable, IndexedRouterState {
    static let initialState = State(
      routes: [.root(.saved(.mock), embedInNavigationView: true)]
    )

    var routes: [Route<Screen.State>]
  }

  enum Action: IndexedRouterAction {
    case routeAction(Int, action: Screen.Action)
    case updateRoutes([Route<Screen.State>])
  }

  var body: some ReducerProtocol<State, Action> {
    return Reduce<State, Action> { state, action in
      switch action {
      case .routeAction(_, action: .saved(.profileTapped)):
        state.routes.presentSheet(.profile(.mock))
      default:
        break
      }
      return .none
    }
    .forEachRoute {
      Screen()
    }
  }
}

struct CoordinatorView: View {
  let store: Store<Coordinator.State, Coordinator.Action>

  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) {
        CaseLet(state: /Screen.State.news, action: Screen.Action.news) { store in NewsView(store: store) }
        CaseLet(state: /Screen.State.onlines, action: Screen.Action.onlines, then: OnlinesView.init)
        CaseLet(state: /Screen.State.profile, action: Screen.Action.profile) { store in ProfileView(store: store) }
        CaseLet(state: /Screen.State.favorites, action: Screen.Action.favorites) { store in FavoritesView(store: store) }
        CaseLet(state: /Screen.State.sports, action: Screen.Action.sports, then: SportsView.init)
        CaseLet(state: /Screen.State.saved, action: Screen.Action.saved) { store in SavedView(store: store) }
      }
    }
  }
}
