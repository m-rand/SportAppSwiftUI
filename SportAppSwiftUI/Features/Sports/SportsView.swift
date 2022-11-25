//
//  Sports.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct SportsView: View {
  let store: StoreOf<SportsFeature>

  var body: some View {
    NavigationView {
      let columns = [
        GridItem(.fixed(104), alignment: .top),
        GridItem(.fixed(104), alignment: .top),
        GridItem(.fixed(104), alignment: .top)
      ]

      List {
        Section("All Leagues") {
          ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
              ForEachStore(store.scope(state: \.leagues, action: SportsFeature.Action.league(id:action:))) {
                LeagueView(store: $0)
              }
            }
            .padding(.horizontal)
          }
        }

        Section("All Teams") {
          ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
              ForEachStore(store.scope(state: \.teams, action: SportsFeature.Action.team(id:action:))) {
                TeamView(store: $0)
              }
            }
            .padding(.horizontal)
          }
        }
      }.navigationTitle("Sports")
    }
  }
}


struct SportsView_Previews: PreviewProvider {
  static var previews: some View {
    SportsView(store: StoreOf<SportsFeature>(initialState: .mock, reducer: SportsFeature()))
  }
}


