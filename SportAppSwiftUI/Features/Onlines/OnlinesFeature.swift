//
//  SportEventsFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 03.11.2022.
//

import ComposableArchitecture
import Foundation

struct OnlinesFeature: ReducerProtocol {

  enum Action {
    case event(id: SportEvent.ID, action: SportEventFeature.Action)
  }

  var body: some ReducerProtocol<Onlines, Action> {
    Reduce { state, action in
      switch action {
        default: return .none
      }
    }.forEach(\.events, action: /Action.event(id:action:)) {
      SportEventFeature()
    }
  }
}
