//
//  Movie.swift
//  movie-app-ios
//
//  Created by Paweł on 13/11/2022.
//

import SwiftUI

struct Movie: Codable, Identifiable {
    let id: Int64
    let title: String
    let overview: String
    let originalLanguage: String
    let releaseDate: String
    let genres: [Genre]
    let posterPath: String
    let runtime: String?
    let status: String?
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case originalLanguage = "original_language"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case id
        case title
        case overview
        case genres
        case runtime
        case status
    }
}
