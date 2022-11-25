//
//  ContentView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
  let store: StoreOf<SportApp>
  @State var selection = 0

  var body: some View {
    TabView(selection: $selection) {
      NewsView(
        store: self.store.scope(
          state: \.news,
          action: SportApp.Action.news
        )
      ).tabItem {
        if selection == 0 {
          Image("NewsLight")
            .renderingMode(.template)
            .tint(.accentColor)
          Text("News")
        } else {
          Image("NewsLight")
        }
      }.tag(0)

      OnlinesView(
        store: self.store.scope(
          state: \.onlines,
          action: SportApp.Action.onlines
        )
      ).tabItem {
        if selection == 1 {
          Image("OnlineLight")
            .renderingMode(.template)
            .tint(.accentColor)
          Text("Onlines")
        } else {
          Image("OnlineLight")
        }
      }.tag(1)

      FavoritesView(
        store: self.store.scope(
          state: \.sports,
          action: SportApp.Action.favorites
        )
      ).tabItem {
        if selection == 2 {
          Image("FavoritesLight")
            .renderingMode(.template)
            .tint(.accentColor)
          Text("Favorites")
        } else {
          Image("FavoritesLight")
        }
      }.tag(2)

      SportsView(
        store: self.store.scope(
          state: \.sports,
          action: SportApp.Action.sports
        )
      ).tabItem {
        if selection == 3 {
          Image("SportsLight")
            .renderingMode(.template)
            .tint(.accentColor)
          Text("Sports")
        } else {
          Image("SportsLight")
        }
      }.tag(3)

      SavedView(
        store: self.store.scope(
          state: { $0[keyPath: \.self] },
          action: SportApp.Action.saved
        )
      ).tabItem {
        if selection == 4 {
          Image("SavedLight")
            .renderingMode(.template)
            .tint(.accentColor)
          Text("Saved")
        } else {
          Image("SavedLight")
        }
      }.tag(4)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(store: Store(
      initialState: .mock,
      reducer: SportApp()._printChanges()
    ))
  }
}


