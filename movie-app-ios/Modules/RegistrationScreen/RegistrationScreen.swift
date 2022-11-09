//
//  RegistrationScreen.swift
//  movie-app-ios
//
//  Created by Paweł on 09/11/2022.
//

import SwiftUI

struct RegistrationScreen: View {
    @State private var email: String = ""
    @State private var login: String = ""
    @State private var password: String = ""

    var body: some View {

            NavigationView {
                ZStack {
                    Asset.Colors.btnDark.swiftUIColor
                        .ignoresSafeArea()

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
                        VStack {
                            TextField("", text: $email)
                                .placeholder(when: email.isEmpty) {
                                    Text("e-mail")
                                        .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                        .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                }
                                .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
                                .disableAutocorrection(true)
                                .multilineTextAlignment(.leading)
                                .frame(width: 327, height: 64)
                                .background(Asset.Colors.btnGray.swiftUIColor)
                                .cornerRadius(AppConstants.buttonCornerRadius)
                                .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                            TextField("", text: $login)
                                .placeholder(when: login.isEmpty) {
                                    Text("login")
                                        .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                        .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                }
                                .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
                                .disableAutocorrection(true)
                                .multilineTextAlignment(.leading)
                                .frame(width: 327, height: 64)
                                .background(Asset.Colors.btnGray.swiftUIColor)
                                .cornerRadius(AppConstants.buttonCornerRadius)
                                .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                .padding(.top, 16)
                            SecureField("password", text: $password)
                                .placeholder(when: password.isEmpty) {
                                    Text("password")
                                        .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                        .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                }
                                .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
                                .disableAutocorrection(true)
                                .multilineTextAlignment(.leading)
                                .frame(width: 327, height: 64)
                                .background(Asset.Colors.btnGray.swiftUIColor)
                                .cornerRadius(AppConstants.buttonCornerRadius)
                                .foregroundColor(Asset.Colors.btnDarkText.swiftUIColor)
                                .font(.custom(FontFamily.SFProRounded.bold, size: 18))
                                .padding(.top, 16)
                        }
                        .padding(.top, 64)
                        Spacer()
                        VStack {
                            Button {
                                print("clicked")
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

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
    }
}
