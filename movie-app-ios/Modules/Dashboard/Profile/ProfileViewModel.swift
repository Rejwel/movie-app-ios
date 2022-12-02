//
//  ProfileViewModel.swift
//  movie-app-ios
//
//  Created by Paweł on 23/11/2022.
//

import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {

    var cancellables = Set<AnyCancellable>()

    @Published var signoutTapped = false
    @Published var enableReading: Bool

    init(signoutTapped: Bool = false) {
        self.signoutTapped = signoutTapped
        self.enableReading = DefaultsHelper.getReadFilmDescription() == nil ? false : DefaultsHelper.getReadFilmDescription()!

        self.$enableReading.sink { isEnabled in
            DefaultsHelper.putReadFilmDescription(value: isEnabled)
        }.store(in: &self.cancellables)
    }

    func signoutTap() {
        signoutTapped = true
        KeychainHelper.shared.deleteKeychainData(dataType: .bearerToken)

    }
}
