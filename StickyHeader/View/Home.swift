//
//  Home.swift
//  StickyHeader
//
//  Created by Mohammed Rokon Uddin on 10/3/24.
//

import SwiftUI

struct Home: View {
  var safeArea: EdgeInsets
  var size: CGSize
  var albums = Album.mock

  var body: some View {
    ScrollView(.vertical) {
      VStack {
        ArtWork()

        GeometryReader { geometry in
          let minY = geometry.frame(in: .named("SCROLL")).minY - safeArea.top
          Button {

          } label: {
            Text("SHUFFLE PLAY")
              .font(.callout)
              .fontWeight(.bold)
              .foregroundStyle(.white)
              .padding(.horizontal, 45)
              .padding(.vertical, 12)
              .background {
                Capsule()
                  .fill(Color("Green").gradient)
              }
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .offset(y: minY < 50 ? -(minY - 54) : 0)
        }
        .frame(height: 50)
        .padding(.top, -34)
        .zIndex(1)

        VStack {
          Text("Popular")
            .fontWeight(.heavy)
          AlbumView()
        }
        .padding(.top, 8)
        .zIndex(0)
      }
      .overlay(alignment: .top) {
        HeaderView()
      }
    }
    .coordinateSpace(name: "SCROLL")
  }

  @ViewBuilder
  func AlbumView() -> some View {
    VStack(spacing: 24) {
      ForEach(albums.indices, id: \.self) { index in
        HStack(spacing: 24) {
          Text("\(index + 1)")
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(.gray)

          VStack(alignment: .leading, spacing: 6) {
            Text(albums[index].name)
              .fontWeight(.semibold)
              .foregroundStyle(.white)

            Text("2,282,928")
              .font(.caption)
              .foregroundStyle(.gray)
          }
          .frame(maxWidth: .infinity, alignment: .leading)

          Image(systemName: "ellipsis")
            .foregroundStyle(.gray)
        }
      }
    }
    .padding(16)
  }

  @ViewBuilder
  func ArtWork() -> some View {
    let height = size.height * 0.45
    GeometryReader { geometry in
      let size = geometry.size
      let minY = geometry.frame(in: .named("SCROLL")).minY
      let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))

      Image("Artwork")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
        .clipped()
        .overlay {
          ZStack(alignment: .bottom) {
            Rectangle()
              .fill(
                .linearGradient(
                  colors: [
                    .black.opacity(0 - progress),
                    .black.opacity(0.1 - progress),
                    .black.opacity(0.3 - progress),
                    .black.opacity(0.5 - progress),
                    .black.opacity(0.8 - progress),
                    .black.opacity(1),
                  ], startPoint: .top, endPoint: .bottom)
              )

            VStack(spacing: 0) {
              Text("Yasser\nAd-Doseri")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
              Text("509,082 Monthy Listeners")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            }
            .opacity(1 + (progress > 0 ? -progress : progress))
            .padding(.bottom, 56)
            .offset(y: minY < 0 ? minY : 0)
          }
        }
        .offset(y: -minY)
    }
    .frame(height: height + safeArea.top)
  }

  @ViewBuilder
  func HeaderView() -> some View {
    GeometryReader { geometry in
      let minY = geometry.frame(in: .named("SCROLL")).minY
      let height = size.height * 0.45
      let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
      let titleProgress = minY / height
      HStackLayout(spacing: 16) {
        Button {
        } label: {
          Image(systemName: "chevron.left")
            .font(.title3)
            .foregroundStyle(.white)
        }

        Spacer(minLength: 0)
        Button {
        } label: {
          Text("FOLLOWING")
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .border(.white, width: 1.5)

        }
        .opacity(1 + progress)

        Button {
        } label: {
          Image(systemName: "ellipsis")
            .font(.title3)
            .foregroundStyle(.white)
        }
      }
      .overlay {
        Text("Yasser Ad-Doseri")
          .fontWeight(.semibold)
          .offset(y: -titleProgress > 0.75 ? 0 : 46)
          .clipped()
          .animation(.easeInOut(duration: 0.25), value: -titleProgress > 0.75)
      }
      .padding(.top, safeArea.top + 10)
      .padding([.horizontal, .bottom], 16)
      .background {
        Color.black.opacity(-progress > 1 ? 1 : 0)
      }
      .offset(y: -minY)
    }
    .frame(height: 35)
  }
}

#Preview {
  ContentView()
}
