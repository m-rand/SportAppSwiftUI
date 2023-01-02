//
//  SavedFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import ComposableArchitecture
import Foundation

struct SavedFeature: ReducerProtocol {

  enum Action {
//    case event(id: SportEvent.ID, action: SportEventFeature.Action)
//    case article(id: Article.ID, action: ArticleFeature.Action)
    case onlines(OnlinesFeature.Action)
    case news(NewsFeature.Action)

    // navigation
    case profileTapped
    case profile(ProfileFeature.Action)
  }

  var body: some ReducerProtocol<SportAppModel, Action> {
    Reduce { state, action in
      switch action {
      case .profileTapped:
        return .none
      default: return .none
      }
    }
    Scope(state: \.self, action: /Action.profile) {
      ProfileFeature()
    }
    Scope(state: \.onlines, action: /Action.onlines) {
      OnlinesFeature()
    }
    Scope(state: \.news, action: /Action.news) {
      NewsFeature()
    }
//    .forEach(\.onlines.events, action: /Action.event(id:action:)) {
//      SportEventFeature()
//    }
//    .forEach(\.news.articles, action: /Action.article(id:action:)) {
//      ArticleFeature()
//    }
  }
}

