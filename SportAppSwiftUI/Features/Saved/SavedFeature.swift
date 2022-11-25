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
    case event(id: SportEvent.ID, action: SportEventFeature.Action)
    case article(id: Article.ID, action: ArticleFeature.Action)
  }

  var body: some ReducerProtocol<SportApp.State, Action> {
    Reduce { state, action in
      switch action {
      default: return .none
      }
    }
    .forEach(\.onlines.events, action: /Action.event(id:action:)) {
      SportEventFeature()
    }
    .forEach(\.news.articles, action: /Action.article(id:action:)) {
      ArticleFeature()
    }
  }
}

