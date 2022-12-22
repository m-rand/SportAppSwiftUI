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
        TabImage(imageName: "NewsLight")
        if selection == 0 {
          Text("News")
        }
      }.tag(0)

      OnlinesView(
        store: self.store.scope(
          state: \.onlines,
          action: SportApp.Action.onlines
        )
      ).tabItem {
        TabImage(imageName: "OnlineLight")
        if selection == 1 {
          Text("Onlines")
        }
      }.tag(1)

      FavoritesView(
        store: self.store.scope(
          state: \.sports,
          action: SportApp.Action.favorites
        )
      ).tabItem {
        TabImage(imageName: "FavoritesLight")
        if selection == 2 {
          Text("Favorites")
        }
      }.tag(2)

      SportsView(
        store: self.store.scope(
          state: \.sports,
          action: SportApp.Action.sports
        )
      ).tabItem {
        TabImage(imageName: "SportsLight")
        if selection == 3 {
          Text("Sports")
        }
      }.tag(3)

      SavedView(
        store: self.store.scope(
          state: { $0[keyPath: \.self] },
//          action: { $0 }
          action: SportApp.Action.saved
        )
      ).tabItem {
        TabImage(imageName: "SavedLight")
        if selection == 4 {
          Text("Saved")
        }
      }.tag(4)
    }
  }
}

struct TabImage: View {
  let imageName: String

  var body: some View {
    Image(imageName)
      .renderingMode(.template)
      .tint(.accentColor)
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


