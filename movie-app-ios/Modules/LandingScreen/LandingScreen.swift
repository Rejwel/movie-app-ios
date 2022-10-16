//
//  LandingScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 16/10/2022.
//

import SwiftUI

struct LandingScreen: View {
    var body: some View {
        ZStack {
            Asset.Colors.bgLanding.swiftUIColor.ignoresSafeArea()

            VStack {
                Spacer()
                Button {
                    print("Clicked")
                } label: {
                    Text("Get started")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.bordered)
                .padding()
            }
            Text("Image").foregroundColor(.white)
        }
    }
}

struct LandingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LandingScreen()
    }
}
