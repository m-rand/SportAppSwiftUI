//
//  FavoritingView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 24.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct FavoriteButton<ID: Hashable & Sendable>: View {
  let store: Store<FavoritingState<ID>, FavoritingAction>

  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      Button {
        viewStore.send(.buttonTapped)
      } label: {
        Image(systemName: "heart")
          .symbolVariant(viewStore.isFavorite ? .fill : .none)
      }
      .alert(self.store.scope(state: \.alert), dismiss: .alertDismissed)
    }
  }
}

struct FavoritingButton_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteButton(store: Store(initialState: FavoritingState(id: 0, isFavorite: false), reducer: Favoriting()))
  }
}

//struct FavoritingView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct FavoritingView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritingView()
//    }
//}
