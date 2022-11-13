//
//  LandingScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 16/10/2022.

import SwiftUI

struct LandingScreen: View {
    @State private var buttonTapped = false

    var body: some View {

        NavigationView {
            ZStack {
                VStack {
                    Text("Welcome to movie app")
                        .multilineTextAlignment(.center)
                        .font(.custom(FontFamily.SFProRounded.bold, size: 38))
                        .foregroundColor(.white)
                        .padding()
                        .background(Asset.Colors.btnDark.swiftUIColor)
                        .cornerRadius(25)
                        .padding()
                        .padding(.top, 120)
                    Spacer()
                    VStack {
                        Spacer()
                        NavigationLink(destination: LoginScreen(), isActive: $buttonTapped) {
                            Button {
                                self.buttonTapped = true
                            } label: {
                                Text("Get started")
                                    .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                    .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                    .frame(width: 327, height: 64)
                            }
                            .background(Asset.Colors.btnDark.swiftUIColor)
                            .cornerRadius(AppConstants.buttonCornerRadius)
                        }
                    }
                }
            }
            .background {
                Image(uiImage: Asset.Assets.landingImage.image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black.opacity(0.4))
            }
            .onAppear {
                APIService.register(registerParameters: RegisterParameters(username: "test", emailAddress: "test", password: "test")) { _ in
                }
            }
        }
    }
}

struct LandingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LandingScreen()
    }
}
