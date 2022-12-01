//
//  ProfileScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 23/11/2022.
//

import SwiftUI

struct ProfileScreen: View {

    @ObservedObject private var viewModel = ProfileViewModel()
    @Binding var uiTabBarController: UITabBarController?

    var body: some View {
        NavigationView {
            ZStack {
                Asset.Colors.btnDark.swiftUIColor
                    .ignoresSafeArea()

                VStack {
                    Text("Dashboard")
                        .font(.custom(FontFamily.SFProRounded.bold, size: 24))
                        .foregroundColor(.white)
                        .padding(.top, 64)

                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 80, weight: .regular))
                        .foregroundColor(.blue)
                        .padding(.top, 8)

                    VStack {
                        TextInput(text: "e-mail", disabled: true)
                        TextInput(text: "username", disabled: true)
                        TextInput(text: "••••••••", disabled: true)
                    }
                    .padding(.top, 32)

                    PrimaryButton(text: "Sign out", isActive: $viewModel.signoutTapped) {
                        uiTabBarController?.tabBar.removeFromSuperview()
                        viewModel.signoutTap()
                    } destination: {
                        LandingScreen()
                    }
                    .padding(.top, 48)
                    Spacer()
                }
            }
        }
    }
}
