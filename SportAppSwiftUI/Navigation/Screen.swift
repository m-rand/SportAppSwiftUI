//
//  Screen.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 22.12.2022.
//

import ComposableArchitecture
import Foundation
import TCACoordinators


struct Screen: ReducerProtocol {
  enum State: Equatable {
    case profile(SportApp.State)
    case news(NewsFeature.State)
    case onlines(OnlinesFeature.State)
    case favorites(SportsFeature.State)
    case sports(SportsFeature.State)
    case saved(SportApp.State)
    case following(FavoritesFeature.State)
  }

  enum Action {
    case profile(ProfileFeature.Action)
    case news(NewsFeature.Action)
    case onlines(OnlinesFeature.Action)
    case favorites(FavoritesFeature.Action)
    case sports(SportsFeature.Action)
    case saved(SavedFeature.Action)
    case following(FavoritesFeature.Action)
  }

  var body: some ReducerProtocol<State, Action> {
    EmptyReducer()
      .ifCaseLet(/State.profile, action: /Action.profile) {
        ProfileFeature()
      }
      .ifCaseLet(/State.news, action: /Action.news) {
        NewsFeature()
      }
      .ifCaseLet(/State.onlines, action: /Action.onlines) {
        OnlinesFeature()
      }
      .ifCaseLet(/State.favorites, action: /Action.favorites) {
        FavoritesFeature()
      }
      .ifCaseLet(/State.sports, action: /Action.sports) {
        SportsFeature()
      }
      .ifCaseLet(/State.saved, action: /Action.saved) {
        SavedFeature()
      }
      .ifCaseLet(/State.following, action: /Action.following) {
        FavoritesFeature()
      }
  }
}
