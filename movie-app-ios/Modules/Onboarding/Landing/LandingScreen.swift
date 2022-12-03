//
//  LandingScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 16/10/2022.

import SwiftUI

struct LandingScreen: View {

    @EnvironmentObject var tokenHelper: TokenHelper

    var body: some View {

        NavigationView {
            GeometryReader { geometry in
                Image(uiImage: Asset.Assets.landingImage.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width)
            }.overlay(
                VStack {
                    Text("Welcome to movie app")
                        .frame(width: 250)
                        .multilineTextAlignment(.center)
                        .font(.custom(FontFamily.SFProRounded.bold, size: 38))
                        .foregroundColor(.white)
                        .padding()
                        .background(Asset.Colors.btnDark.swiftUIColor)
                        .cornerRadius(25)
                        .padding(.top, 120)
                    Spacer()
                    VStack {
                        Spacer()
                        NavigationLink {
                            LoginScreen()
                                .environmentObject(tokenHelper)
                        } label: {
                            Text("Get started")
                                .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                .frame(width: 327, height: 64)
                        }
                        .background(Asset.Colors.btnDark.swiftUIColor)
                        .cornerRadius(AppConstants.buttonCornerRadius)
                        .padding(.bottom, 32)
                    }
                }
            )
        }
        .navigationViewStyle(.stack)
    }
}
