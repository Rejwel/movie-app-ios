//
//  Transition+Extensions.swift
//  movie-app-ios
//
//  Created by Paweł on 02/12/2022.
//

import SwiftUI

extension AnyTransition {
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))}
}
