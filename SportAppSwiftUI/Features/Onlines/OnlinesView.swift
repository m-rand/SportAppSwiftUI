//
//  SportEventsView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 03.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct OnlinesView: View {
  let store: StoreOf<OnlinesFeature>

  var body: some View {
    NavigationView {
      List {
        Section(header: Text("TODAY")) {
          ForEachStore(
            self.store.scope(state: \.todayEvents, action: OnlinesFeature.Action.event(id:action:))
          ) {
            SportEventView(store: $0)
          }
        }
        Section(header: Text("TOMORROW")) {
          ForEachStore(
            self.store.scope(state: \.tomorrowEvents, action: OnlinesFeature.Action.event(id:action:))
          ) {
            SportEventView(store: $0)
          }
        }
      }.navigationTitle("Onlines")
    }
  }
}

struct SportEventsView_Previews: PreviewProvider {
  static var previews: some View {
    OnlinesView(store: StoreOf<OnlinesFeature>(initialState: .mock, reducer: OnlinesFeature()))
  }
}

