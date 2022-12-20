//
//  ProfileView.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 15.12.2022.
//

import ComposableArchitecture
import SwiftUI

struct ProfileView: View {
  let store: StoreOf<SportApp>
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          HStack(alignment: .top) {
            VStack {
              Image(systemName: "person")
                .resizable()
                .frame(width: 60, height: 60)
                .padding()
              Text("Fanynka Mia").font(.headline)
              Text("mia_akrim@instagram.com").font(.callout)
            }.padding()
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        Section {
  //        HStack {
  //          Text("Sledované")
  //        }
          NavigationLink(
            "Sledované",
            destination: FollowingView(
              store: self.store.scope(
                state: \.sports,
                action: SportApp.Action.favorites
              )
            )
          )
        }
        Section {
          HStack {
            Text("Nastavení")
          }
          HStack {
            Text("Odeslat zpětnou vazbu")
          }
          HStack {
            Text("O aplikaci")
          }
          HStack {
            Text("Smazat přednačtené články").foregroundColor(.red)
          }
        }
        Section {
          HStack(alignment: .center) {
            Text("Odhlásit se")
              .foregroundColor(.red)
          }
        }
      }
      .navigationTitle("Profil")
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView(store: Store(initialState: .mock, reducer: SportApp()))
  }
}
