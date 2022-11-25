//
//  SportEventView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 03.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct SportEventView: View {
  let store: StoreOf<SportEventFeature>

  init(store: StoreOf<SportEventFeature>) {
    self.store = store
    formatter.allowedUnits = [.hour, .minute]
  }

  var body: some View {
    WithViewStore(self.store) { viewStore in
      switch viewStore.gameInfo {
      case let .football(footballGameInfo):
        FootballView(viewStore: viewStore, footballGameInfo: footballGameInfo)
      case let .tennis(tennisGameInfo):
        TennisView(viewStore: viewStore, tennisGameInfo: tennisGameInfo)
      }
    }
  }
}

struct FootballView: View {
  let viewStore: ViewStoreOf<SportEventFeature>
  let footballGameInfo: FootballGameInfo

  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 8) {
        HStack {
          Text(footballGameInfo.team1.shortName)
          Text(footballGameInfo.team1.name)
        }
        HStack {
          Text(footballGameInfo.team2.shortName)
          Text(footballGameInfo.team2.name)
        }
      }
      Spacer()
      Text(formatter.string(from: viewStore.duration)!)
      Text("\(viewStore.result)")
      Image(systemName: viewStore.remind ? "bell.badge.fill" : "bell.badge")
        .onTapGesture {
          viewStore.send(.remindToggle)
        }
    }.padding()
  }
}

struct TennisView: View {
  let viewStore: ViewStoreOf<SportEventFeature>
  let tennisGameInfo: TennisGameInfo

  var body: some View {
    if case let .single(info) = tennisGameInfo {
      HStack {
        VStack(alignment: .leading, spacing: 8) {
          HStack {
            Text(info.player1.name)
          }
          HStack {
            Text(info.player2.name)
          }
        }
        Spacer()
        Text(formatter.string(from: viewStore.duration)!)
        Text("\(viewStore.result)")
        Image(systemName: viewStore.remind ? "bell.badge.fill" : "bell.badge")
          .onTapGesture {
            viewStore.send(.remindToggle)
          }
      }.padding()
    }
  }
}

let formatter = DateComponentsFormatter()

struct SportEventView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SportEventView(store: StoreOf<SportEventFeature>(initialState: OnlinesFeature.State.mock.events.first!, reducer: SportEventFeature()))
      SportEventView(store: StoreOf<SportEventFeature>(initialState: OnlinesFeature.State.mock.events.dropFirst().first!, reducer: SportEventFeature()))
      SportEventView(store: StoreOf<SportEventFeature>(initialState: OnlinesFeature.State.mock.events.dropFirst().dropFirst().first!, reducer: SportEventFeature()))
    }
  }
}

