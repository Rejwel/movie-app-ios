//
//  DefaultsHelper.swift
//  movie-app-ios
//
//  Created by Paweł on 01/12/2022.
//

import Foundation

struct DefaultsHelper {

    enum DefaultKeys: String {
        case readFilmDescription = "read_film_description"
        case isLoggedIn = "is_logged_in"
    }

    static func getReadFilmDescription() -> Bool? {
        return UserDefaults.standard.bool(forKey: DefaultKeys.readFilmDescription.rawValue)
    }

    static func putReadFilmDescription(value: Bool) {
      UserDefaults.standard.set(value, forKey: DefaultKeys.readFilmDescription.rawValue)
    }

    static func getIsLoggedIn() -> Bool? {
        return UserDefaults.standard.bool(forKey: DefaultKeys.isLoggedIn.rawValue)
    }

    static func putIsLoggedIn(value: Bool) {
      UserDefaults.standard.set(value, forKey: DefaultKeys.isLoggedIn.rawValue)
    }
}
