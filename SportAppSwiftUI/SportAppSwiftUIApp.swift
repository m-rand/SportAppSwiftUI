//
//  SportAppSwiftUIApp.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 02.11.2022.
//

import ComposableArchitecture
import SwiftUI

@main
struct SportAppSwiftUIApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(
        store: Store(
          initialState: .mock,
          reducer: SportApp()._printChanges().signpost()
        )
      )
    }
  }
}
