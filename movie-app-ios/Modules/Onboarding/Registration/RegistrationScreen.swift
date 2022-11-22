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

        NavigationView {
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
                        TextField("", text: $viewModel.emailAddress)
                            .placeholder(when: $viewModel.emailAddress.wrappedValue.isEmpty) {
                                Text("e-mail")
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
                        TextField("", text: $viewModel.username)
                            .placeholder(when: $viewModel.username.wrappedValue.isEmpty) {
                                Text("login")
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
                            .padding(.top, 16)
                        SecureField("password", text: $viewModel.password)
                            .placeholder(when: $viewModel.password.wrappedValue.isEmpty) {
                                Text("password")
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
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen(showingPopup: .constant(false))
    }
}
