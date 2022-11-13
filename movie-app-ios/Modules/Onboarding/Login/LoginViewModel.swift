//
//  LoginModel.swift
//  movie-app-ios
//
//  Created by Paweł on 13/11/2022.
//

import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var username = ""
    @Published var password = ""

    @Published var errorMessage = ""

    @Published var isLoading = false
    @Published var loginSuccess = false
    @Published var registrationLabelTapped = false

    public func login() {
        isLoading = true
        APIService.login(loginParameters: LoginParameters(username: username, password: password)) { [weak self] res in
            switch res {
            case .success(let success):
                self?.errorMessage = ""
                self?.loginSuccess = true
                // TODO: Token management
            case .failure(let failure):
                self?.errorMessage = failure.message
                self?.isLoading = false
            }
        }
    }

}
