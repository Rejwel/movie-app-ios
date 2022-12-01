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

    func readDescription(description: String) {
        let utterance = AVSpeechUtterance(string: description)

        // Configure the utterance.
        utterance.rate = 0.57
        utterance.pitchMultiplier = 0.8
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 0.8

        // Retrieve the British English voice.
        let voice = AVSpeechSynthesisVoice(language: "en-GB")

        // Assign the voice to the utterance.
        utterance.voice = voice

        // Create a speech synthesizer.

        // Tell the synthesizer to speak the utterance.
        synthesizer.speak(utterance)
    }

    func addMovieToFavourite(ID: String) {

        APIService.addMovieToFavoritesByID(ID: ID) { _ in

        }
    }

    func removeFavoriteMovie(ID: String) {

        APIService.removeMovieFromFavoritesByID(ID: ID) { _ in

        }
    }
}
