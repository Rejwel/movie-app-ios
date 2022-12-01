//
//  FilmDetails.swift
//  movie-app-ios
//
//  Created by Paweł on 11/11/2022.
//

import SwiftUI
import Kingfisher

struct FilmDetails: View {

    @ObservedObject private var viewModel = FilmDetailsViewModel()

    let movie: Movie
    let image: KFImage

    var body: some View {
        ZStack {
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
                        if movie.releaseDate != nil && !movie.genres.isEmpty {
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
                        viewModel.addMovieToFavourite(ID: String(movie.id))
                    } label: {
                        Image(systemName: "heart")
                            .font(.system(size: 32, weight: .regular))
                            .tint(.white)
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                }
                .padding(.bottom, 30)
            }
        }
        .background {
            Asset.Colors.btnDark.swiftUIColor
                .ignoresSafeArea()

            image
                .resizable()
                .scaledToFill()
                .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear, .clear]),
                                     startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.top)
                .opacity(0.7)
                .padding(.trailing, 60)
        }
    }
}
