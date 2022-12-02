//
//  TokenHelper.swift
//  movie-app-ios
//
//  Created by Paweł on 02/12/2022.
//

import SwiftUI

class TokenHelper: ObservableObject {

    @Published var isLoggedIn: Bool {
        didSet {
            DefaultsHelper.putIsLoggedIn(value: isLoggedIn)
        }
    }

    init() {
        self.isLoggedIn =  DefaultsHelper.getIsLoggedIn() == nil ? false : DefaultsHelper.getIsLoggedIn()!
    }
}
