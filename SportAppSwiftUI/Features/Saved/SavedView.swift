//
//  SavedView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import _SwiftUINavigationState
import ComposableArchitecture
import SwiftUI

struct SavedView: View {
  let store: StoreOf<SavedFeature>
  @State var showingProfile: Bool = false

  var body: some View {
    NavigationView {
      List {
        Section("Onlines") {
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              let onlineStore = store.scope(state: \.onlines, action: SavedFeature.Action.onlines)

              ForEachStore(
                onlineStore.scope(
                  state: \.todayEvents,
                  action: OnlinesFeature.Action.event(id:action:)
                )
              ) {
                SportEventView(store: $0)
              }.border(.green)
            }
          }
        }

        Section("News") {
          let articlesStore = store.scope(state: \.news, action: SavedFeature.Action.news)
          ForEachStore(
            articlesStore.scope(
              state: \.articles,
              action: NewsFeature.Action.article(id:action:)
            )
          ) {
            ArticleRowView(store: $0)
          }
        }
      }
      .navigationTitle("Saved")
      .toolbar {
        Button(action: {
          showingProfile.toggle()
        }) {
          Image(systemName: "person.crop.circle")
            .accessibilityLabel("User Profile")
        }
      }
      .sheet(isPresented: $showingProfile) {
        ProfileView(store: store.scope(state: { $0[keyPath: \.self] }, action: SavedFeature.Action.profile))
      }
    }
  }
}

struct SavedView_Previews: PreviewProvider {
  static var previews: some View {
    SavedView(store: Store(initialState: .mock, reducer: SavedFeature()))
  }
}

