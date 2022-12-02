//
//  movie_app_iosApp.swift
//  movie-app-ios
//
//  Created by Paweł on 16/10/2022.
//

import SwiftUI

@main
struct MovieApp: App {

    private var tokenSaved: Bool = KeychainHelper.shared.readKeychainDataString(dataType: .bearerToken) != nil

    var body: some Scene {
        WindowGroup {
            Navigator()
                .environmentObject(TokenHelper())
        }
    }
}
