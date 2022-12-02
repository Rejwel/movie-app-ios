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

    @Published var email: String = "e-mail"
    @Published var username: String = "username"

    init(signoutTapped: Bool = false) {

        self.signoutTapped = signoutTapped
        self.enableReading = DefaultsHelper.getReadFilmDescription() == nil ? false : DefaultsHelper.getReadFilmDescription()!

        self.$enableReading.sink { isEnabled in
            DefaultsHelper.putReadFilmDescription(value: isEnabled)
        }.store(in: &self.cancellables)

        fetchUserData()
    }

    func fetchUserData() {

        KeychainHelper.shared.checkIfTokenExpiredAndExtend()

        APIService.getUser { [weak self] res in
            guard let strongSelf = self else { return }
            switch res {
            case .success(let success):
                strongSelf.email = success.email ?? "e-mail"
                strongSelf.username = success.username
            case .failure(let err):
                print(err)
            }
        }
    }

    func signoutTap() {

        signoutTapped = true
        KeychainHelper.shared.deleteKeychainData(dataType: .bearerToken)
    }
}
