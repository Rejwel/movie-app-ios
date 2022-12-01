//
//  PreferencesViewModel.swift
//  movie-app-ios
//
//  Created by Paweł on 30/11/2022.
//

import SwiftUI

class PreferencesViewModel: ObservableObject {

    func getUserFavoriteMovies(completion: @escaping ([Movie]) -> Void) {
        APIService.getUserFavoriteMovies { res in
            switch res {
            case .success(let success):
                completion(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }

    func removeFavoriteMovie(ID: String) {
        APIService.removeMovieFromFavoritesByID(ID: ID) { res in
            switch res {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
