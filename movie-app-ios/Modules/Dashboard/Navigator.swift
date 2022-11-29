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
    @State var uiViewController: UIViewController?

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
                ProfileScreen(uiTabBarController: $uiTabBarController)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
            .frame(width: UIScreen.main.bounds.width,
                   height: uiTabBarController?.tabBar != nil ? UIScreen.main.bounds.height : UIScreen.main.bounds.height + 100.00)
            .introspectTabBarController { (UITabBarController) in
                uiTabBarController = UITabBarController
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
