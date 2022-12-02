//
//  PreferencesViewModel.swift
//  movie-app-ios
//
//  Created by Paweł on 30/11/2022.
//

import SwiftUI

class PreferencesViewModel: ObservableObject {

    func getUserFavoriteMovies(completion: @escaping ([Movie]) -> Void) {

        KeychainHelper.shared.checkIfTokenExpiredAndExtend()

        APIService.getUserFavoriteMovies { res in
            switch res {
            case .success(let success):
                completion(success)
            case .failure:
                break
            }
        }
    }

    func removeFavoriteMovie(ID: String) {

        KeychainHelper.shared.checkIfTokenExpiredAndExtend()

        APIService.removeMovieFromFavoritesByID(ID: ID) { _ in

        }
    }
}
