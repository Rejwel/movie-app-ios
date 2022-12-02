//
//  SecuredTextInput.swift
//  movie-app-ios
//
//  Created by Paweł on 23/11/2022.
//

import SwiftUI

struct SecuredTextInput: View {
    var text: String
    var binding: Binding<String>

    init(text: String,
         binding: Binding<String>) {
        self.text = text
        self.binding = binding
    }

    var body: some View {
        SecureField(text, text: binding)
            .placeholder(when: binding.wrappedValue.isEmpty) {
                Text(text)
                    .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                    .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
            }
            .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .frame(width: 327, height: 64)
            .background(Asset.Colors.btnGray.swiftUIColor)
            .cornerRadius(AppConstants.buttonCornerRadius)
            .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
            .font(.custom(FontFamily.SFProRounded.bold, size: 18))
    }
}
