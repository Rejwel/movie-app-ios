//
//  ProfileScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 23/11/2022.
//

import SwiftUI

struct ProfileScreen: View {

    @ObservedObject private var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Asset.Colors.btnDark.swiftUIColor
                    .ignoresSafeArea()

                VStack {
                    Text("Dashboard")
                        .font(.custom(FontFamily.SFProRounded.regular, size: 18))
                        .foregroundColor(.white)

                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 64, weight: .regular))
                        .tint(.white)

                    TextInput(text: "e-mail", disabled: true)
                    TextInput(text: "username", disabled: true)
                    TextInput(text: "••••••••", disabled: true)

                    PrimaryButton(text: "Sign out", isActive: $viewModel.signoutTapped) {
                        viewModel.signoutTap()
                    } destination: {
                        LandingScreen()
                    }
                }
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
