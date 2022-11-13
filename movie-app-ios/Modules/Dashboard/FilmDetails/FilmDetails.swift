//
//  FilmDetails.swift
//  movie-app-ios
//
//  Created by Paweł on 11/11/2022.
//

import SwiftUI

struct FilmDetails: View {
    var body: some View {
        ZStack {
            VStack {

                Spacer()

                Text("Black Panther: Wakanda Forever")
                    .font(.custom(FontFamily.SFProRounded.bold, size: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)

                HStack(alignment: .center) {
                    Text("2022")
                    Text(" | ")
                    Text("2h 41m")
                    Text(" | ")
                    Text("Action, Sci-Fi")
                }
                .font(.custom(FontFamily.SFProRounded.regular, size: 17))
                .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                .padding(.bottom, 20)

                VStack {
                    Text("Storyline")
                        .font(.custom(FontFamily.SFProRounded.bold, size: 24))
                        .foregroundColor(.white)
                        .padding(.bottom, 10)

                    Text("The nation of Wakanda is pitted against intervening world powers as they mourn the loss of their king T'Challa.")
                        .font(.custom(FontFamily.SFProRounded.regular, size: 20))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
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
                        print("clicked")
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
        .toolbar(.hidden, for: .tabBar)
        .background {
            Asset.Colors.btnDark.swiftUIColor
                .ignoresSafeArea()

            Image("template_image")
                .resizable()
                .scaledToFill()
//                .frame(width: UIScreen.screenWidth, alignment: .center)
                .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear, .clear]),
                                     startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.top)
                .opacity(0.7)
                .padding(.trailing, 60)
        }
    }
}

struct FilmDetails_Previews: PreviewProvider {
    static var previews: some View {
        FilmDetails()
    }
}
