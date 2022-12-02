//
//  AppError.swift
//  movie-app-ios
//
//  Created by Paweł on 12/11/2022.
//

import UIKit

struct AppError: Codable, Error {
    let errorCode: Int
    let message: String
}
