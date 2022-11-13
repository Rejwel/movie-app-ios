//
//  AppToken.swift
//  movie-app-ios
//
//  Created by Paweł on 12/11/2022.
//

import UIKit

struct AppToken: Codable {
    let accessToken: String
    let refreshToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
