//
//  Home.swift
//  movie-app-ios
//
//  Created by Paweł on 09/11/2022.
//

import SwiftUI
import Kingfisher

struct HomeScreen: View {
    @State private var searchText = ""
    @State private var movies: [Movie] = []
    @State var currentIndexOfFilm: Int = 0

    @ObservedObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Asset.Colors.btnDark.swiftUIColor
                    .ignoresSafeArea()

                VStack {
                    GenrePicker()
                    Spacer()
                    FilmView(currentIndex: $currentIndexOfFilm, films: $movies, viewModel: viewModel)
                }
            }
            .searchable(text: $searchText)
            .disableAutocorrection(true)
            .foregroundColor(.white)
            .onSubmit(of: .search) {
                viewModel.fetchMoviesByQuery(query: searchText) { movies in
                    currentIndexOfFilm = 0
                    self.movies = movies
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Welcome")
                            .font(.custom(FontFamily.SFProRounded.bold, size: 24))
                            .foregroundColor(.white)
                        Text("username")
                            .font(.custom(FontFamily.SFProRounded.bold, size: 24))
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct GenrePicker: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                Button {
                    print("clicked")
                } label: {
                    Text("Action")
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                .cornerRadius(AppConstants.buttonCornerRadius)

                Button {
                    print("clicked")
                } label: {
                    Text("Comedy")
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                .cornerRadius(AppConstants.buttonCornerRadius)

                Button {
                    print("clicked")
                } label: {
                    Text("Sci-Fi")
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                .cornerRadius(AppConstants.buttonCornerRadius)

                Button {
                    print("clicked")
                } label: {
                    Text("Fantasy")
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                .cornerRadius(AppConstants.buttonCornerRadius)
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct FilmView: View {
    @Binding var currentIndex: Int
    @Binding var films: [Movie]
    @State var filmTapped = false
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                FilmCarousel(list: films, index: $currentIndex) { film in

                    GeometryReader { proxy in

                        let size = proxy.size
                        let filmPadding: CGFloat = film.id == films[currentIndex].id ? 10 : 40
                        let image = KFImage(URL(string: film.posterPath)!)
                                        .placeholder({
                                            ZStack {
                                                Color.gray
                                            }
                                        })
                                        .loadDiskFileSynchronously()
                                        .fade(duration: 0.25)

                        NavigationLink {
                            FilmDetails(movie: film,
                                        image: image,
                                        isFavorite: false)
                        } label: {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: size.width, height: size.height)
                                .opacity(film.id == films[currentIndex].id ? 1 : 0.3)
                                .cornerRadius(AppConstants.buttonCornerRadius)
                                .padding(.vertical, filmPadding)
                                .animation(.easeInOut, value: filmPadding)
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 90)
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 30)
            .onAppear {
                if films.isEmpty {
                    viewModel.fetchMovies { movies in
                        currentIndex = 0
                        films = movies
                    }
                }
            }
            VStack {
                    if !films.isEmpty {
                        Text(films[currentIndex].title)
                            .padding(.horizontal, 60)
                            .font(.custom(FontFamily.SFProRounded.regular, size: 18))
                            .foregroundColor(.white)
                        if films[currentIndex].genres.count > 2 {
                            VStack {
                                Text(films[currentIndex].releaseDate.prefix(4))
                                    .font(.custom(FontFamily.SFProRounded.regular, size: 18))
                                    .foregroundColor(.white)
                            }
                            VStack {
                                HStack {
                                    ForEach(films[currentIndex].genres.prefix(3)) { genre in
                                        Button {
                                        } label: {
                                            Text(genre.name)
                                                .foregroundColor(.white)
                                        }
                                        .disabled(true)
                                        .buttonStyle(.borderedProminent)
                                        .cornerRadius(AppConstants.buttonCornerRadius)
                                    }
                                }
                            }
                        } else {
                            HStack {
                                Text(films[currentIndex].releaseDate.prefix(4))
                                    .font(.custom(FontFamily.SFProRounded.regular, size: 18))
                                    .foregroundColor(.white)

                                ForEach(films[currentIndex].genres) { genre in
                                    Button {
                                    } label: {
                                        Text(genre.name)
                                            .foregroundColor(.white)
                                    }
                                    .disabled(true)
                                    .buttonStyle(.borderedProminent)
                                    .cornerRadius(AppConstants.buttonCornerRadius)
                                }
                            }
                        }
                    }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 20)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
