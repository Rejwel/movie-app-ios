//
//  APIService.swift
//  movie-app-ios
//
//  Created by Paweł on 12/11/2022.
//

import SwiftUI
import Alamofire

struct APIServiceConstants {
    static let ApiURL = "https://springmovieappserver.herokuapp.com/api"
}

class APIService {

    public static func login(loginParameters: LoginParameters,
                             completion: @escaping (Result<AppToken, AppError>) -> Void) {

        AF.request("\(APIServiceConstants.ApiURL)/login",
                   method: .post,
                   parameters: loginParameters,
                   encoder: .json).responseDecodable(of: AppToken.self) { response in

            guard let value = response.value,
                  (200..<300).contains(response.response!.statusCode) else {
                completion(.failure(AppError(errorCode: response.response!.statusCode, message: "result_failiure")))
                return
            }

            completion(.success(value))
        }
    }

    public static func refreshToken(completion: @escaping (Result<String, AppError>) -> Void) {

        guard let token = KeychainHelper.shared.readKeychainDataString(dataType: .refreshToken) else { return }

        let headers: HTTPHeaders = [
            .authorization(bearerToken: token)
        ]

        AF.request("\(APIServiceConstants.ApiURL)/token/refresh",
                   method: .get,
                   headers: headers).response { response in

            guard (200..<300).contains(response.response!.statusCode) else {
                completion(.failure(AppError(errorCode: response.response!.statusCode, message: "result_failiure")))
                return
            }

            completion(.success("result_success"))
        }
    }

    public static func register(registerParameters: RegisterParameters,
                                completion: @escaping (Result<String, AppError>) -> Void) {

        AF.request("\(APIServiceConstants.ApiURL)/register",
                   method: .post,
                   parameters: registerParameters,
                   encoder: .json).response { response in

            guard (200..<300).contains(response.response!.statusCode) else {
                completion(.failure(AppError(errorCode: response.response!.statusCode, message: "result_failiure")))
                return
            }

            completion(.success("result_success"))
        }
    }

    public static func getUser(completion: @escaping (Result<User, AppError>) -> Void) {

        guard let token = KeychainHelper.shared.readKeychainDataString(dataType: .bearerToken) else { return }

        let headers: HTTPHeaders = [
            .authorization(bearerToken: token)
        ]

        AF.request("\(APIServiceConstants.ApiURL)/user",
                   method: .get,
                   headers: headers).responseDecodable(of: User.self) { response in

            guard let value = response.value,
                  (200..<300).contains(response.response!.statusCode) else {
                completion(.failure(AppError(errorCode: response.response!.statusCode, message: "result_failiure")))
                return
            }

            completion(.success(value))
        }
    }
}
