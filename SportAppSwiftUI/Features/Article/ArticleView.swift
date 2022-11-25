//
//  ArticleView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 04.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct ArticleView: View {
  let store: StoreOf<ArticleFeature>

  var body: some View {
    WithViewStore(self.store) { viewStore in
      HStack {
        VStack(alignment: .leading) {
          AsyncImage(url: viewStore.image) { image in
            image.resizable()
          } placeholder: {
            Color.gray
          }
          .frame(width: 100, height: 75)
          .clipShape(RoundedRectangle(cornerRadius: 6))
          Text(viewStore.publishDate, style: .date)
            .font(.caption)
        }

        VStack {
          Text(viewStore.headline)
            .font(.headline)
          HStack {
            Text(viewStore.authors.first ?? "")
              .font(.caption)
            Spacer()
            VStack {
              Image(systemName: viewStore.liked ? "heart.fill" : "heart")
              Text("\(viewStore.likes)")
            }.font(.caption)
            .onTapGesture {
              viewStore.send(.likeToggle)
            }
          }
        }
      }
    }
  }
}

struct ArticleView_Previews: PreviewProvider {
  static var previews: some View {
    ArticleView(store: Store(initialState: NewsFeature.State.mock.articles.first!, reducer: ArticleFeature()))
  }
}
