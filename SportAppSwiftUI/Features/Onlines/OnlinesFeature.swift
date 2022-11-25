//
//  SportEventsFeature.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 03.11.2022.
//

import ComposableArchitecture
import Foundation

struct OnlinesFeature: ReducerProtocol {
  struct State: Equatable {
    var events: IdentifiedArrayOf<SportEventFeature.State>

    var todayEvents: IdentifiedArrayOf<SportEventFeature.State> {
      events.filter { Calendar.current.isDateInToday($0.date) }
    }

    var tomorrowEvents: IdentifiedArrayOf<SportEventFeature.State> {
      events.filter { Calendar.current.isDateInTomorrow($0.date) }
    }
  }

  enum Action {
    case event(id: SportEvent.ID, action: SportEventFeature.Action)
  }

  var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
        default: return .none
      }
    }.forEach(\.events, action: /Action.event(id:action:)) {
      SportEventFeature()
    }
  }
}
