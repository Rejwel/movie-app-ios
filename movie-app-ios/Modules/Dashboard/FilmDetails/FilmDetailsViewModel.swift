//
//  FilmDetailsViewModel.swift
//  movie-app-ios
//
//  Created by Paweł on 30/11/2022.
//

import UIKit

class FilmDetailsViewModel: ObservableObject {

    func addMovieToFavourite(ID: String) {

        APIService.addMovieToFavoritesByID(ID: ID) { res in
            switch res {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
