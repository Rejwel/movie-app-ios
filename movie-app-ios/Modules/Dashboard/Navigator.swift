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

    init() {

        UITabBar.appearance().unselectedItemTintColor = UIColor.systemBlue
    }

    var body: some View {
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
            ProfileScreen(uiTabBarController: $uiTabBarController)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .introspectTabBarController { (UITabBarController) in
            uiTabBarController = UITabBarController
        }
    }
}

struct Navigator_Previews: PreviewProvider {
    static var previews: some View {
        Navigator()
    }
}
