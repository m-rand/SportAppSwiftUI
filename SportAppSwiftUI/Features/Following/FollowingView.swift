//
//  FollowingView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 15.12.2022.
//

import ComposableArchitecture
import SwiftUI

struct FollowingView: View {
  let store: StoreOf<FavoritesFeature>

  var body: some View {
    List {
      Section("Leagues") {
        ForEachStore(store.scope(state: \.favoriteLeagues, action: FavoritesFeature.Action.league(id:action:))) { leagueStore in
          WithViewStore(leagueStore) { leagueViewStore in
            Text(leagueViewStore.name)
          }
        }
      }
      Section("Teams") {
        ForEachStore(store.scope(state: \.favoriteTeams, action: FavoritesFeature.Action.team(id:action:))) { teamStore in
          WithViewStore(teamStore) { teamViewStore in
            Text(teamViewStore.name)
          }
        }
      }
    }
    .navigationTitle("Sledované")
  }
}

struct FollowingView_Previews: PreviewProvider {
  static var previews: some View {
    FollowingView(store: Store(initialState: .mock, reducer: FavoritesFeature()))
  }
}

