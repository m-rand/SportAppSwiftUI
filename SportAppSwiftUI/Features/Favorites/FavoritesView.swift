//
//  Favorites.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct FavoritesView: View {
  let store: StoreOf<FavoritesFeature>
  @State var showingProfile: Bool = false

  var body: some View {
    NavigationView {
      List {
        Section("Leagues") {
          VStack {
            ScrollView(.horizontal, showsIndicators: false) {
              HStack(alignment: .top, spacing: 32) {
                ForEachStore(store.scope(state: \.favoriteLeagues, action: FavoritesFeature.Action.league(id:action:))) {
                  LeagueView(store: $0)
                }
              }
            }
          }
        }

        Section("Teams") {
          VStack {
            ScrollView(.horizontal, showsIndicators: false) {
              HStack(alignment: .top, spacing: 32) {
                ForEachStore(store.scope(state: \.favoriteTeams, action: FavoritesFeature.Action.team(id:action:))) {
                  TeamView(store: $0)
                }
              }
            }
          }
        }
      }
      .navigationTitle("SPORT.CZ")
      .toolbar {
        Button(action: { showingProfile.toggle() }) {
          Image(systemName: "person.crop.circle")
            .accessibilityLabel("User Profile")
        }
      }
    }
  }
}

struct FavoritesView_Previews: PreviewProvider {
  static var previews: some View {
    FavoritesView(store: Store(initialState: .mock, reducer: FavoritesFeature()))
  }
}

