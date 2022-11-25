//
//  ArticleFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 04.11.2022.
//

import ComposableArchitecture
import Foundation

struct ArticleFeature: ReducerProtocol {

  enum Action {
    case likeToggle
    case likeResponse(TaskResult<Int>)
  }

  @Dependency(\.likeClient) var likeClient

  func reduce(into state: inout Article, action: Action) -> EffectTask<Action> {
    switch action {
    case .likeToggle:
//      state.liked.toggle()
//      state.likes += state.liked ? 1 : -1
//      return .none

      return .task { [count = state.likes, liked = state.liked] in
        await .likeResponse(TaskResult { try await self.likeClient.like(liked, count) })
      }
    case let .likeResponse(.success(result)):
      state.liked.toggle()
      state.likes = result
      return .none
    case .likeResponse(.failure):
      return .none
    }
  }
}
