//
//  PreferencesScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 23/11/2022.
//

import SwiftUI
import Kingfisher

struct PreferencesScreen: View {

    @ObservedObject private var viewModel = PreferencesViewModel()

    @State private var movies: [Movie] = []
    @State private var timerElapsed: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Asset.Colors.btnDark.swiftUIColor
                    .ignoresSafeArea()

                VStack {

                    VStack {
                        Text("Preferences")
                            .font(.custom(FontFamily.SFProRounded.bold, size: 24))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 64)

                    if movies.isEmpty {
                        if timerElapsed {
                            withAnimation {
                                Text("You have no films yet, add them!")
                                    .font(.custom(FontFamily.SFProRounded.bold, size: 24))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 16)
                                    .padding(.top, 64)
                            }
                        }
                    }

                    ScrollView {
                        ForEach(movies) { movie in
                            if !movies.isEmpty {
                                NavigationLink {
                                    FilmDetails(movie: movie,
                                                image: KFImage(URL(string: movie.posterPath)!)
                                                        .placeholder({
                                                            ZStack {
                                                                Color.gray
                                                            }
                                                        })
                                                        .loadDiskFileSynchronously()
                                                        .fade(duration: 0.25),
                                                            isFavorite: true)
                                } label: {
                                    HStack {
                                        KFImage(URL(string: movie.posterPath)!)
                                            .placeholder({
                                                ZStack {
                                                    Color.gray
                                                }
                                            })
                                            .loadDiskFileSynchronously()
                                            .fade(duration: 0.25)
                                            .resizable()
                                            .frame(width: 80, height: 100)
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(AppConstants.buttonCornerRadius)
                                        VStack(alignment: .leading) {
                                            Text(movie.title)
                                                .padding(.leading, 8)
                                                .font(.custom(FontFamily.SFProRounded.regular, size: 18))
                                                .foregroundColor(.white)
                                            HStack {
                                                Spacer()
                                                Button {
                                                    print("clicked")
                                                } label: {
                                                    Image(systemName: "bell.fill")
                                                        .font(.system(size: 32, weight: .regular))
                                                        .tint(.white)
                                                }
                                                Button {
                                                    viewModel.removeFavoriteMovie(ID: String(movie.id))
                                                    movies.remove(at: movies.firstIndex(where: { $0.id == movie.id })!)
                                                } label: {
                                                    Image(systemName: "heart.fill")
                                                        .font(.system(size: 32, weight: .regular))
                                                        .tint(.white)
                                                }
                                            }
                                            .padding(.top, 16)
                                        }

                                    }
                                    .frame(height: 120)
                                    .padding(.horizontal, 32)
                                    .padding(.vertical, 8)
                                    .background {
                                        Color.gray
                                            .cornerRadius(AppConstants.buttonCornerRadius)
                                            .opacity(0.3)
                                            .padding(.horizontal, 16)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 32)
                    .onAppear {
                        timerElapsed = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            timerElapsed = true
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.getUserFavoriteMovies { movies in
                self.movies = movies
            }
        }
    }
}

struct PreferencesScreen_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesScreen()
    }
}
