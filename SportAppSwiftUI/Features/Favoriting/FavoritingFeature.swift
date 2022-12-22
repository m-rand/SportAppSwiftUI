//
//  Favoriting.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 24.11.2022.
//

import ComposableArchitecture
import Foundation

struct FavoritingState<ID: Hashable & Sendable>: Equatable {
  var alert: AlertState<FavoritingAction>?
  let id: ID
  var isFavorite: Bool
}

enum FavoritingAction: Equatable {
  case alertDismissed
  case buttonTapped
  case response(TaskResult<Bool>)
}

struct Favoriting<ID: Hashable & Sendable>: ReducerProtocol {

  @Dependency(\.favoriteClient) var favoriteClient

  private struct CancelID: Hashable {
    let id: AnyHashable
  }

  func reduce(
    into state: inout FavoritingState<ID>, action: FavoritingAction
  ) -> EffectTask<FavoritingAction> {
    switch action {
    case .alertDismissed:
      state.alert = nil
      state.isFavorite.toggle()
      return .none

    case .buttonTapped:
      let favorite = state.isFavorite
      state.isFavorite.toggle()

      return .task { [id = state.id, isFavorite = favorite] in
        await .response(TaskResult { try await self.favoriteClient.setFavorite(id as! UUID, isFavorite) })
      }
      .cancellable(id: CancelID(id: state.id), cancelInFlight: true)

    case let .response(.failure(error)):
      state.alert = AlertState(title: TextState(error.localizedDescription))
      return .none

    case let .response(.success(isFavorite)):
      state.isFavorite = isFavorite // just for reverting if it failed
      return .none
    }
  }
}
