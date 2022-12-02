//
//  FilmDetailsViewModel.swift
//  movie-app-ios
//
//  Created by Paweł on 30/11/2022.
//

import UIKit
import AVFAudio

class FilmDetailsViewModel: ObservableObject {

    let synthesizer = AVSpeechSynthesizer()

    func readDescription(title: String, date: String, description: String, genres: [Genre], runtime: String?) {

        guard DefaultsHelper.getReadFilmDescription() != nil, DefaultsHelper.getReadFilmDescription() == true else {
            return
        }

        let utterance = AVSpeechUtterance(string: """
        Title: \(title).
        Release Date: \(date).
        Runtime: \(runtime != nil ? runtime! + " minutes" : "Undefined").
        Genres: \(genres.map { $0.name }.joined(separator: ",")).
        Description: \(description).
        """)

        utterance.rate = 0.57
        utterance.pitchMultiplier = 0.8
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 0.8

        let voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.voice = voice

        synthesizer.speak(utterance)
    }

    func addMovieToFavourite(ID: String) {

        KeychainHelper.shared.checkIfTokenExpiredAndExtend {
            APIService.addMovieToFavoritesByID(ID: ID) { _ in

            }
        }
    }

    func removeFavoriteMovie(ID: String) {

        KeychainHelper.shared.checkIfTokenExpiredAndExtend {
            APIService.removeMovieFromFavoritesByID(ID: ID) { _ in

            }
        }
    }
}
