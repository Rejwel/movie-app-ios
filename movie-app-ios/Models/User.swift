//
//  User.swift
//  movie-app-ios
//
//  Created by Paweł on 13/11/2022.
//

import SwiftUI

struct User: Codable {
    let id: String
    let username: String
    let favoriteGenres: [Genre?]
    let favoriteMovies: [Movie?]
    let notificationsMovie: [Movie?]
}
