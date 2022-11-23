//
//  PreferencesScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 23/11/2022.
//

import SwiftUI

struct PreferencesScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Asset.Colors.btnDark.swiftUIColor
                    .ignoresSafeArea()
            }
        }
    }
}

struct PreferencesScreen_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesScreen()
    }
}
