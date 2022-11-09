//
//  FilmModel.swift
//  movie-app-ios
//
//  Created by Paweł on 09/11/2022.
//

import SwiftUI

struct Film: Identifiable {
    var id = UUID().uuidString
    var filmImage: String
}
