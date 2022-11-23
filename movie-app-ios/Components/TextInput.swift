//
//  TextInput.swift
//  movie-app-ios
//
//  Created by Paweł on 22/11/2022.
//

import SwiftUI

struct TextInput: View {
    var text: String
    var disabled: Bool?
    var binding: Binding<String>?

    init(text: String,
         disabled: Bool? = nil,
         binding: Binding<String>? = nil) {
        self.text = text
        self.disabled = disabled
        self.binding = binding
    }

    var body: some View {
        TextField(text, text: binding ?? .constant(text))
            .placeholder(when: binding?.wrappedValue.isEmpty ?? true) {
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
            .disabled(disabled ?? false)
    }
}
