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
      WithViewStore(store) { viewStore in
        Section("Leagues") {
          ForEachStore(store.scope(state: \.favoriteLeagues, action: FavoritesFeature.Action.league(id:action:))) { leagueStore in
            WithViewStore(leagueStore) { leagueViewStore in
              Text(leagueViewStore.name)
            }
          }.onDelete { indexSet in
            indexSet.forEach { index in
              let id = viewStore.favoriteLeagues[index].id
              viewStore.send(.league(id: id, action: .favorite(.buttonTapped)))
            }
          }
        }
        Section("Teams") {
          ForEachStore(store.scope(state: \.favoriteTeams, action: FavoritesFeature.Action.team(id:action:))) { teamStore in
            WithViewStore(teamStore) { teamViewStore in
              Text(teamViewStore.name)
            }
          }.onDelete { indexSet in
            indexSet.forEach { index in
              let id = viewStore.favoriteTeams[index].id
              viewStore.send(.team(id: id, action: .favorite(.buttonTapped)))
            }
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

