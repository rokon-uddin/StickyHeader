//
//  Album.swift
//  StickyHeader
//
//  Created by Mohammed Rokon Uddin on 10/3/24.
//

import Foundation

struct Album: Identifiable {
  let id = UUID().uuidString
  let name: String

  static let mock: [Album] = [
    .init(name: "Al-Quran"),
    .init(name: "Al-Hadith"),
    .init(name: "Mahfil"),
    .init(name: "Live Show"),
    .init(name: "QA Session"),
    .init(name: "Dua"),
    .init(name: "Talk Shows"),
    .init(name: "On-Air"),
    .init(name: "Al-Quran"),
    .init(name: "Al-Quran"),
    .init(name: "Al-Hadith"),
  ]
}
