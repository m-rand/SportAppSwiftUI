//
//  NewsFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import ComposableArchitecture
import Foundation

struct NewsFeature: ReducerProtocol {

  enum Action {
    case article(id: Article.ID, action: ArticleFeature.Action)
  }

  var body: some ReducerProtocol<News, Action> {
    Reduce { state, action in
      switch action {
      default: return .none
      }
    }
    .forEach(\.articles, action: /Action.article(id:action:)) {
      ArticleFeature()
    }
  }
}
