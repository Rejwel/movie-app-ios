//
//  ProfileViewModel.swift
//  movie-app-ios
//
//  Created by Paweł on 23/11/2022.
//

import SwiftUI

class ProfileViewModel: ObservableObject {

    @Published var signoutTapped = false

    func signoutTap() {
        signoutTapped = true
        KeychainHelper.shared.deleteKeychainData(dataType: .bearerToken)
    }
}
