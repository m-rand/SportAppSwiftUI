//
//  TeamView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 07.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct LeagueView: View {
  let store: StoreOf<LeagueFeature>

  var body: some View {
    WithViewStore(store) { viewStore in
      HStack(alignment: .top) {
        VStack {
          HStack {
            Spacer()
            FavoriteButton(
              store: self.store.scope(
                state: \.favorite,
                action: LeagueFeature.Action.favorite
              )
            )
          }.frame(height: 20)

          AsyncImage(url: viewStore.image) { image in
            image.resizable()
          } placeholder: {
            Color.gray
          }
          .frame(width: 104, height: 104)
          .clipShape(RoundedRectangle(cornerRadius: 25))
          Text(viewStore.name)
            .multilineTextAlignment(.center)
            .font(.headline)
        }
      }.frame(width: 104)
    }
  }
}

struct Leagueiew_Previews: PreviewProvider {
  static var previews: some View {
    LeagueView(store: Store(initialState: SportsFeature.State.mock.leagues.first!, reducer: LeagueFeature()))
  }
}

