//
//  RegistrationScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 09/11/2022.
//

import SwiftUI
import ExytePopupView

struct RegistrationScreen: View {

    @Environment(\.presentationMode) var presentation

    @StateObject private var viewModel = RegistrationViewModel()

    @Binding var showingPopup: Bool

    var body: some View {

        ZStack {
            Asset.Colors.btnDark.swiftUIColor
                .ignoresSafeArea()

            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(3)
                    .zIndex(1)
            }

            VStack {
                VStack {
                    Text("Create new account")
                        .font(.custom(FontFamily.SFProRounded.bold, size: 24))
                        .foregroundColor(.white)
                    Text("Please fill in the form to continue")
                        .font(.custom(FontFamily.SFProRounded.bold, size: 14))
                        .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                        .padding(.top, 2)
                }
                .padding(.top, 64)
                VStack(alignment: .leading) {
                    TextInput(text: "e-mail", binding: $viewModel.emailAddress)
                    TextInput(text: "username", binding: $viewModel.username)
                        .padding(.top, 16)
                    SecuredTextInput(text: "password", binding: $viewModel.password)
                        .padding(.top, 16)
                    Text($viewModel.errorMessage.wrappedValue)
                        .foregroundColor(.red)
                        .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                        .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
                        .padding(.top, 16)
                }
                .padding(.top, 64)
                Spacer()
                VStack {

                    Button {
                        viewModel.register { userCreated in
                            if userCreated {
                                self.presentation.wrappedValue.dismiss()
                                showingPopup = true
                            }
                        }
                    } label: {
                        Text("Sign up")
                            .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                            .foregroundColor(.white)
                            .frame(width: 327, height: 64)
                    }
                    .background(.blue)
                    .cornerRadius(AppConstants.buttonCornerRadius)
                    .padding(.bottom, 16)

                    HStack {
                        Text("Have an account?")
                            .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                            .foregroundColor(.white)
                        Text("Sign in")
                            .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                            .foregroundColor(.blue)
                            .onTapGesture {
                                self.presentation.wrappedValue.dismiss()
                            }
                    }
                }
                .padding(.bottom, 64)
            }
        }
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen(showingPopup: .constant(false))
    }
}
