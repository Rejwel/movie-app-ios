//
//  FilmDetailsViewModel.swift
//  movie-app-ios
//
//  Created by Paweł on 30/11/2022.
//

import UIKit

class FilmDetailsViewModel: ObservableObject {

    func addMovieToFavourite(ID: String) {

        APIService.addMovieToFavoritesByID(ID: ID) { _ in

        }
    }

    func removeFavoriteMovie(ID: String) {

        APIService.removeMovieFromFavoritesByID(ID: ID) { _ in

        }
    }
}
