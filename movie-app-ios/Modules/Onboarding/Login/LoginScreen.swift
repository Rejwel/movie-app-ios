//
//  LoginScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 09/11/2022.
//

import SwiftUI

struct LoginScreen: View {
    @ObservedObject var viewModel = LoginViewModel()

    // TODO: Change this later on...

    var body: some View {

            NavigationStack {
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
                            TextField("", text: $viewModel.username)
                                .placeholder(when: $viewModel.username.wrappedValue.isEmpty) {
                                    Text("login")
                                        .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                        .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                }
                                .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
                                .disableAutocorrection(true)
                                .frame(width: 327, height: 64)
                                .background(Asset.Colors.btnGray.swiftUIColor)
                                .cornerRadius(AppConstants.buttonCornerRadius)
                                .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                            SecureField("password", text: $viewModel.password)
                                .placeholder(when: $viewModel.password.wrappedValue.isEmpty) {
                                    Text("password")
                                        .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                        .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                }
                                .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
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
                            NavigationLink(destination: Navigator(), isActive: $viewModel.loginSuccess) {
                                Button {
                                    viewModel.login()
                                } label: {
                                    Text("Sign in")
                                        .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                        .foregroundColor(.white)
                                        .frame(width: 327, height: 64)
                                }
                                .background(.blue)
                                .cornerRadius(AppConstants.buttonCornerRadius)
                                .padding(.bottom, 16)
                            }

                            HStack {
                                Text("Don't have an accont?")
                                    .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                    .foregroundColor(.white)
                                NavigationLink(destination: RegistrationScreen(), isActive: $viewModel.registrationLabelTapped) {
                                    Text("Sign up")
                                        .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                        .foregroundColor(.blue)
                                        .onTapGesture {
                                            viewModel.registrationLabelTapped = true
                                        }
                                }
                            }

                        }
                        .padding(.bottom, 64)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
