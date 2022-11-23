//
//  Navigator.swift
//  movie-app-ios
//
//  Created by Paweł on 11/11/2022.
//

import SwiftUI

struct Navigator: View {

    private var tokenSaved: Bool

    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.systemBlue

        tokenSaved = KeychainHelper.shared.readKeychainDataString(dataType: .bearerToken) != nil
    }

    var body: some View {

        if tokenSaved {
            TabView {
                HomeScreen()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                PreferencesScreen()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Preferences")
                    }
                ProfileScreen()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
        } else {
            LandingScreen()
        }
    }
}

struct Navigator_Previews: PreviewProvider {
    static var previews: some View {
        Navigator()
    }
}
