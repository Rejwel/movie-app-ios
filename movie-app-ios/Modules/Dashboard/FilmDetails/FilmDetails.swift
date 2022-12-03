//
//  FilmDetails.swift
//  movie-app-ios
//
//  Created by Paweł on 11/11/2022.
//

import SwiftUI
import Kingfisher

struct FilmDetails: View {

    @Environment(\.horizontalSizeClass) var sizeClass

    @ObservedObject private var viewModel = FilmDetailsViewModel()

    let movie: Movie
    let image: KFImage
    @State var isFavorite: Bool

    var body: some View {

        GeometryReader { _ in
            ZStack {
                Asset.Colors.btnDark.swiftUIColor
                    .ignoresSafeArea()
                VStack {

                    if sizeClass == .compact {
                        image
                            .resizable()
                            .scaledToFit()
                            .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear, .clear]),
                                                 startPoint: .top, endPoint: .bottom))
                            .opacity(0.7)
                    } else {
                        image
                            .resizable()
                            .scaledToFill()
                            .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear, .clear]),
                                                 startPoint: .top, endPoint: .bottom))
                            .opacity(0.7)
                    }

                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            }
        }.overlay(
            VStack {

                VStack {

                    Spacer()
                    Text(movie.title)
                        .font(.custom(FontFamily.SFProRounded.bold, size: 30))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)

                    HStack(alignment: .center) {
                        Text(movie.releaseDate.prefix(4))
                        if movie.runtime != nil {
                            Text(" | ")
                            Text(movie.runtime!)
                            Text(" | ")
                        } else {
                            if movie.releaseDate != "" && !movie.genres.isEmpty {
                                Text(" | ")
                            }
                        }
                        Text(movie.genres.map { $0.name }.joined(separator: ", "))
                    }
                    .font(.custom(FontFamily.SFProRounded.regular, size: 17))
                    .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                    .padding(.bottom, 20)

                    VStack {
                        Text("Storyline")
                            .font(.custom(FontFamily.SFProRounded.bold, size: 24))
                            .foregroundColor(.white)
                            .padding(.bottom, 10)

                        ScrollView {
                            Text(movie.overview)
                                .font(.custom(FontFamily.SFProRounded.regular, size: 20))
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .onAppear {
                                    viewModel.readDescription(title: movie.title,
                                                              date: movie.releaseDate,
                                                              description: movie.overview,
                                                              genres: movie.genres,
                                                              runtime: movie.runtime)
                                }
                        }.frame(height: 150)
                    }
                    .padding(.bottom, 40)

                    HStack {
                        Spacer()
                        Button {
                            print("clicked")
                        } label: {
                            Image(systemName: "bell")
                                .font(.system(size: 32, weight: .regular))
                                .tint(.white)
                        }
                        .padding(.horizontal, 20)
                        Button {
                            isFavorite = !isFavorite

                            if isFavorite {
                                viewModel.addMovieToFavourite(ID: String(movie.id))
                            } else {
                                viewModel.removeFavoriteMovie(ID: String(movie.id))
                            }
                        } label: {
                            withAnimation {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .font(.system(size: 32, weight: .regular))
                                    .tint(.white)
                            }
                        }
                        .padding(.horizontal, 20)
                        Spacer()
                    }
                    .padding(.bottom, 30)
                }
            }
        )
        .onDisappear {
            viewModel.synthesizer.stopSpeaking(at: .immediate)
        }
    }
}
