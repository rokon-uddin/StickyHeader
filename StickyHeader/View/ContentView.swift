//
//  ContentView.swift
//  StickyHeader
//
//  Created by Mohammed Rokon Uddin on 10/3/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    GeometryReader {
      let size = $0.size
      let safeArea = $0.safeAreaInsets
      Home(safeArea: safeArea, size: size)
        .ignoresSafeArea(.container, edges: .top)
    }
    .preferredColorScheme(.dark)
  }
}

#Preview {
  ContentView()
}
