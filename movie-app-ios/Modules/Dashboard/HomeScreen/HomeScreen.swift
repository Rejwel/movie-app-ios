//
//  Home.swift
//  movie-app-ios
//
//  Created by Paweł on 09/11/2022.
//

import SwiftUI

struct HomeScreen: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ZStack {
                Asset.Colors.btnDark.swiftUIColor
                    .ignoresSafeArea()

                VStack {
                    GenrePicker()
                    Spacer()
                    FilmView()
                }
            }
            .searchable(text: $searchText)
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
                .buttonStyle(.borderedProminent)
                .cornerRadius(AppConstants.buttonCornerRadius)

                Button {
                    print("clicked")
                } label: {
                    Text("Comedy")
                }
                .buttonStyle(.borderedProminent)
                .cornerRadius(AppConstants.buttonCornerRadius)

                Button {
                    print("clicked")
                } label: {
                    Text("Sci-Fi")
                }
                .buttonStyle(.borderedProminent)
                .cornerRadius(AppConstants.buttonCornerRadius)

                Button {
                    print("clicked")
                } label: {
                    Text("Fantasy")
                }
                .buttonStyle(.borderedProminent)
                .cornerRadius(AppConstants.buttonCornerRadius)
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct FilmView: View {
    @State var currentIndex: Int = 0
    @State var films: [Film] = []

    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                FilmCarousel(list: films, index: $currentIndex) { film in

                    GeometryReader { proxy in

                        let size = proxy.size
                        let filmPadding: CGFloat = film.id == films[currentIndex].id ? 10 : 40

                        Image(film.filmImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width)
                            .opacity(film.id == films[currentIndex].id ? 1 : 0.3)
                            .cornerRadius(AppConstants.buttonCornerRadius)
                            .padding(.vertical, filmPadding)
                            .animation(.easeInOut, value: filmPadding)
                    }
                }
                .padding(.bottom, 120)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .onAppear {
                for index in 1...5 {
                    films.append(Film(filmImage: "template_image"))
                }
            }
            VStack {
                Text("Black Panther: Wakanda Forvere")
                    .font(.custom(FontFamily.SFProRounded.regular, size: 18))
                    .foregroundColor(.white)
                HStack {
                    Text("Date")
                        .font(.custom(FontFamily.SFProRounded.regular, size: 18))
                        .foregroundColor(.white)
                    Button {
                        print("clicked")
                    } label: {
                        Text("Action")
                            .foregroundColor(.white)
                    }
                    .disabled(true)
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(AppConstants.buttonCornerRadius)

                    Button {
                        print("clicked")
                    } label: {
                        Text("Sci-Fi")
                            .foregroundColor(.white)
                    }
                    .disabled(true)
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(AppConstants.buttonCornerRadius)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 40)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
