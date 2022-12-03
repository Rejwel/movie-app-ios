//
//  Navigator.swift
//  movie-app-ios
//
//  Created by Paweł on 11/11/2022.
//

import SwiftUI
import Introspect

struct Navigator: View {

    @State var uiTabBarController: UITabBarController?
    @EnvironmentObject var tokenHelper: TokenHelper

    init() {

        UITabBar.appearance().unselectedItemTintColor = UIColor.systemBlue
    }

    var body: some View {
        if tokenHelper.isLoggedIn {
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
                    .environmentObject(tokenHelper)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
            .transition(.opacity)
            .navigationViewStyle(.stack)
        } else {
            LandingScreen()
                .environmentObject(tokenHelper)
                .transition(.opacity)
        }
    }
}

struct Navigator_Previews: PreviewProvider {
    static var previews: some View {
        Navigator()
    }
}
