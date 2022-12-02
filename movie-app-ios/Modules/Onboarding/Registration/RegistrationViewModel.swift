//
//  RegistrationViewModel.swift
//  movie-app-ios
//
//  Created by Paweł on 13/11/2022.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {

    @Published var username = ""
    @Published var emailAddress = ""
    @Published var password = ""

    @Published var errorMessage = ""

    @Published var isLoading = false

    public func register(userCreated: @escaping (Bool) -> Void) {
        isLoading = true

        APIService.register(registerParameters: RegisterParameters(username: username,
                                                                   emailAddress: emailAddress,
                                                                   password: password)) { [weak self] res in
            switch res {
            case .success:
                self?.errorMessage = ""
                self?.isLoading = false
                userCreated(true)
            case .failure(let failure):
                self?.errorMessage = failure.message
                self?.isLoading = false
                userCreated(false)
            }
        }
    }
}
