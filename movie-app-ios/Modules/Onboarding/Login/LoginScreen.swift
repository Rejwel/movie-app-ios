//
//  LoginScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 09/11/2022.
//

import SwiftUI
import ExytePopupView

struct LoginScreen: View {

    @ObservedObject private var viewModel = LoginViewModel()
    @State private var showingPopup = false

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
                        Text("Welcome back!")
                            .font(.custom(FontFamily.SFProRounded.bold, size: 24))
                            .foregroundColor(.white)
                        Text("Please sign in to your account")
                            .font(.custom(FontFamily.SFProRounded.bold, size: 14))
                            .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                            .padding(.top, 2)
                    }
                    .padding(.top, 64)
                    VStack(alignment: .leading) {

                        TextInput(text: "username", binding: $viewModel.username)
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

                        PrimaryButton(text: "Sign in", isActive: $viewModel.isValid) {
                            viewModel.login()
                        } destination: {
                            Navigator()
                        }
                        .padding(.bottom, 16)

                        HStack {
                            Text("Don't have an accont?")
                                .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                .foregroundColor(.white)

                            NavigationLink {
                                RegistrationScreen(showingPopup: $showingPopup)
                            } label: {
                                Text("Sign up")
                                    .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding(.bottom, 64)
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .popup(isPresented: $showingPopup,
               type: .floater(verticalPadding: 15, useSafeAreaInset: true),
               position: .top,
               autohideIn: 3.5,
               dragToDismiss: true) {
            ZStack {
                VStack(alignment: .center) {
                    Text("Congratulations!")
                        .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(AppConstants.buttonCornerRadius)
                    Text("You have successfully registered your account!")
                        .font(.custom(FontFamily.SFProRounded.bold, size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.top, 1)
                    Text("Please log in to continue.")
                        .font(.custom(FontFamily.SFProRounded.bold, size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 1)
                }
            }
            .padding()
            .frame(width: 327, height: 130)
            .background(.blue)
            .cornerRadius(AppConstants.buttonCornerRadius)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
