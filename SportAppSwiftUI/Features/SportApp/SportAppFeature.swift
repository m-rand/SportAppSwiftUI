//
//  SportAppFeature.swift
//  SportApp
//
//  Created by Marcel Balas on 02.11.2022.
//

import Foundation
import ComposableArchitecture

enum SportAppDestination: Equatable {
  case profile(SportApp)
}

struct SportApp: ReducerProtocol, Equatable {
  struct State: Equatable {
    var user: User
    var news: NewsFeature.State
    var onlines: OnlinesFeature.State
    var sports: SportsFeature.State
//    var saved: SavedFeature.State
    var destination: SportAppDestination?
  }

  enum Action {
    case news(NewsFeature.Action)
    case onlines(OnlinesFeature.Action)
    case favorites(FavoritesFeature.Action)
    case sports(SportsFeature.Action)
    case saved(SavedFeature.Action)
  }

  var body: some ReducerProtocol<State, Action> {
    Scope(state: \.news, action: /Action.news) {
      NewsFeature()
    }
    Scope(state: \.onlines, action: /Action.onlines) {
      OnlinesFeature()
    }
    Scope(state: \.sports, action: /Action.favorites) {
      FavoritesFeature()
    }
    Scope(state: \.sports, action: /Action.sports) {
      SportsFeature()
    }
    Scope(state: \.self, action: /Action.saved) {
      SavedFeature()
    }
  }
}

extension SportApp.State {
  static let mock = SportApp.State(
    user: User(
      userId: 1,
      name: "John Doe",
      avatar: URL(string: "https://pickaface.net/gallery/avatar/ChloeBannink55d5b309e9a10.png"),
      subscriptions: [
        .sportGame(.football),
        .sportGame(.biathlon),
        .league(.premierLeague),
        .league(.rolandGarros),
        .league(.nhl)
      ]
    ),
    news: .mock,
    onlines: .mock,
    sports: .mock
//    saved: .init()
  )
}
