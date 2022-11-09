//
//  LandingScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 16/10/2022.
// https://www.youtube.com/watch?v=l7obVQObdRM&ab_channel=Indently

import SwiftUI

struct LandingScreen: View {
    var body: some View {
        ZStack {
            Image(uiImage: Asset.Assets.landingImage.image)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

//            Asset.Colors.bgLanding.swiftUIColor.ignoresSafeArea()

            VStack {
                Spacer()
                Button {
                    print("Clicked")
                } label: {
                    Text("Get started")
                }
                .foregroundColor(.white)
                .frame(width: 327, height: 64)
                .background(.blue)
                .cornerRadius(AppConstants.buttonCornerRadius)
            }
        }

    }
}

struct LandingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LandingScreen()
    }
}
