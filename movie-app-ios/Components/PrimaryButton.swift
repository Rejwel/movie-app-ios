//
//  PrimaryButton.swift
//  movie-app-ios
//
//  Created by Paweł on 22/11/2022.
//

import SwiftUI

struct PrimaryButton<Content: View>: View {
    var text: String
    var isActive: Binding<Bool>?
    var action: () -> Void
    var destination: () -> Content

    init(text: String,
         isActive: Binding<Bool>? = nil,
         action: @escaping () -> Void,
         @ViewBuilder destination: @escaping () -> Content) {
        self.text = text
        self.isActive = isActive
        self.action = action
        self.destination = destination
    }

    var body: some View {
        NavigationLink(isActive: isActive ?? .constant(true)) {
            destination()
        } label: {
            Button {
                action()
            } label: {
                Text(text)
                    .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                    .foregroundColor(.white)
                    .frame(width: 327, height: 64)
                    .buttonStyle(.automatic)
                    .background(.blue)
                    .cornerRadius(AppConstants.buttonCornerRadius)
                    .padding(.bottom, 16)
            }
        }
    }
}
