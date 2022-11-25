////
////  GameView.swift
////  SportAppSwiftUI
////
////  Created by Marcel Balas on 04.11.2022.
////
//
//import ComposableArchitecture
//import SwiftUI
//
//struct GameView: View {
//  let store: StoreOf<GameFeature>
//
//  var body: some View {
//    WithViewStore(store) { viewStore in
//      HStack(alignment: .top) {
//        VStack {
//          if viewStore.isFavorite {
//            HStack {
//              Spacer()
//              Image(systemName: "star.fill")
//            }
//          }
//          Spacer()
//          AsyncImage(url: viewStore.image) { image in
//            image.resizable()
//          } placeholder: {
//            Color.gray
//          }
//          .frame(width: 104, height: 104)
//          .clipShape(RoundedRectangle(cornerRadius: 25))
//          Text(viewStore.name)
//            .multilineTextAlignment(.center)
//            .font(.headline)
//        }.onTapGesture {
//          viewStore.send(.favoriteToggle)
//        }
//      }.frame(width: 104)
//    }
//  }
//}
//
//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//      GameView(store: Store(initialState: SportsFeature.State.mock.games.first!, reducer: GameFeature()))
//    }
//}
