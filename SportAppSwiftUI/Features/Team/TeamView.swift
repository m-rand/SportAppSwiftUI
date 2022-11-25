//
//  TeamView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 07.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct TeamView: View {
  let store: StoreOf<TeamFeature>

  var body: some View {
    WithViewStore(store) { viewStore in
      HStack(alignment: .top) {
        VStack {
          HStack {
            Spacer()
            FavoriteButton(
              store: self.store.scope(
                state: \.favorite,
                action: TeamFeature.Action.favorite
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

struct TeamView_Previews: PreviewProvider {
  static var previews: some View {
    TeamView(store: Store(initialState: SportsFeature.State.mock.teams.first!, reducer: TeamFeature()))
  }
}

