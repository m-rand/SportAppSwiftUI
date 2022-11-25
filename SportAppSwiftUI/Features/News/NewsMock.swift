//
//  NewsMock.swift
//  SportAppSwiftUI
//
//  Created by Marcel Balas on 07.11.2022.
//

import IdentifiedCollections
import Foundation

extension NewsFeature.State {
  static let mock = NewsFeature.State(articles: IdentifiedArrayOf(uniqueElements: [
    Article(
      id: 1,
      headline: "První zimní výstup na K2 budí vášně. Je to bullshit, říká český dobrodruh",
      image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/K2_2006b.jpg/1200px-K2_2006b.jpg"),
      publishDate: Date(),
      authors: ["Ondřej Vyhlídal"],
      sport: .climbing,
      league: nil,
      text: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      liked: false,
      likes: 8
    ),
    Article(
      id: 2,
      headline: "Průšvih Ovečkina a spol.! Washington na chování Rusů tvrdě doplatil",
      image: URL(string: "https://d16-a.sdn.cz/d_16/c_img_QJ_c/ZuXBr.jpeg"),
      publishDate: Date(),
      authors: ["David Cvrček"],
      sport: .hockey,
      league: .nhl,
      text: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      liked: false,
      likes: 13
    ),
    Article(
      id: 3,
      headline: "Tenisový rozhodčí dostal v karanténě před Australian Open infarkt",
      image: URL(string: "https://d16-a.sdn.cz/d_16/c_img_QR_U/hp6Fs.jpeg"),
      publishDate: Date(),
      authors: ["Marcel Baláš"],
      sport: .tennis,
      league: nil,
      text: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      liked: false,
      likes: 25
    ),
    Article(
      id: 4,
      headline: "Není to ostuda. Zidane překvapil hodnocením po šokujícím vyřazení Realu Madrid",
      image: URL(string: "https://d16-a.sdn.cz/d_16/c_img_QK_a/ecem.jpeg"),
      publishDate: Date(),
      authors: ["Vojta Štursa"],
      sport: .football,
      league: .uefaChampLeague,
      text: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      liked: false,
      likes: 17
    ),
  ]))
}

