//
//  SavedView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct SavedView: View {
  let store: StoreOf<SavedFeature>

  var body: some View {
    NavigationView {
      List {
        Section("Onlines") {
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEachStore(
                self.store.scope(state: \.onlines.todayEvents, action: SavedFeature.Action.event(id:action:))
              ) {
                SportEventView(store: $0)
              }.border(.green)
            }
          }
        }

        Section("News") {
          ForEachStore(store.scope(state: \.news.articles, action: SavedFeature.Action.article(id:action:))
          ) {
            ArticleView(store: $0)
          }
        }
      }.navigationTitle("Saved")
    }
  }
}

struct SavedView_Previews: PreviewProvider {
  static var previews: some View {
    SavedView(store: Store(initialState: .mock, reducer: SavedFeature()))
  }
}

