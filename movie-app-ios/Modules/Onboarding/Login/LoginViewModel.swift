//
//  LoginModel.swift
//  movie-app-ios
//
//  Created by Paweł on 13/11/2022.
//

import SwiftUI

enum LoginDestination: Hashable {
    case registration
    case login
}

class LoginViewModel: ObservableObject {

    @Published var username = ""
    @Published var password = ""

    @Published var errorMessage = ""

    @Published var isLoading = false
    @Published var isValid = false

    public func login(completion: @escaping () -> Void) {
        isLoading = true
        APIService.login(loginParameters: LoginParameters(username: username, password: password)) { [weak self] res in
            switch res {
            case .success(let success):
                print(success)
                self?.errorMessage = ""
                self?.isValid = true
                KeychainHelper.shared.saveAppTokenToKeychain(success)
                completion()
            case .failure(let failure):
                self?.errorMessage = failure.message
                self?.isLoading = false
            }
        }
    }
}
