//
//  HomeModel.swift
//  movie-app-ios
//
//  Created by Paweł on 09/11/2022.
//

import SwiftUI

class HomeModel: ObservableObject {

    @Published var user: User?

    init() {
//        APIService.refreshToken { res in
//            switch res {
//            case .success(let success):
//                print(success)
//            case .failure(let failure):
//                print(failure)
//            }
//        }

//        fetchUser()
    }

    public func fetchUser() {
        APIService.getUser { [weak self] res in
            switch res {
            case .success(let success):
                self?.user = success
            case .failure(let failure):
                print(failure)
                // TODO: Refresh token
            }
        }
    }
}
