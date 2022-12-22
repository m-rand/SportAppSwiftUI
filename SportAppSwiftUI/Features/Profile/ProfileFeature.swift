//
//  ProfileFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 15.12.2022.
//

import ComposableArchitecture
import Foundation

struct ProfileFeature: ReducerProtocol {

  enum Action {
    case favorites(FavoritesFeature.Action)
  }

  var body: some ReducerProtocol<SportApp.State, Action> {
    Scope(state: \.sports, action: /Action.favorites) {
      FavoritesFeature()
    }
  }
}
