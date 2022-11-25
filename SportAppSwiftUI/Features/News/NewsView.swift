//
//  News.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct NewsView: View {
  let store: StoreOf<NewsFeature>

  var body: some View {
    NavigationView {
      List {
        ForEachStore(store.scope(state: \.articles, action: NewsFeature.Action.article(id:action:))
        ) {
          ArticleView(store: $0)
        }
      }.navigationTitle("News")
    }
  }
}

struct NewsView_Previews: PreviewProvider {
  static var previews: some View {
    NewsView(store: Store(initialState: SportApp.State.mock.news, reducer: NewsFeature()))
  }
}

