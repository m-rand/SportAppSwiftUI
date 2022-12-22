//
//  FavoriteClient.swift
//  SportAppWorkshop
//
//  Created by Marcel Balas on 08.11.2022.
//

import ComposableArchitecture
import Foundation
import XCTestDynamicOverlay

struct FavoriteClient {
  var setFavorite: @Sendable (UUID, Bool) async throws -> Bool
}

extension DependencyValues {
  var favoriteClient: FavoriteClient {
    get { self[FavoriteClient.self] }
    set { self[FavoriteClient.self] = newValue }
  }
}

extension FavoriteClient: DependencyKey {
  static var liveValue: FavoriteClient {
    Self(
      setFavorite: { _, value in
        let (data, _) = try await URLSession.shared.data(
          from: URL(string: "https://api.isevenapi.xyz/api/iseven/\(value ? 1 : 0)")!)

        let isEven = try? JSONDecoder().decode(IsEvenModel.self, from: data)
        return isEven?.iseven ?? false
      }
    )
  }
}

struct IsEvenModel: Codable {
  let ad: String
  let iseven: Bool
}
