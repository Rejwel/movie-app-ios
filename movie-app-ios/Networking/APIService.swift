//
//  APIService.swift
//  movie-app-ios
//
//  Created by Paweł on 12/11/2022.
//

import SwiftUI
import Alamofire

struct APIServiceConstants {
    static let ApiURL = "https://movieserver.azurewebsites.net/api"
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
                completion(.failure(AppError(errorCode: response.response?.statusCode ?? 400,
                                             message: "result_failure")))
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
                completion(.failure(AppError(errorCode: response.response?.statusCode ?? 400,
                                             message: "result_failure")))
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
                completion(.failure(AppError(errorCode: response.response?.statusCode ?? 400,
                                             message: "result_failure")))
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
                completion(.failure(AppError(errorCode: response.response?.statusCode ?? 400,
                                             message: "result_failure")))
                return
            }

            completion(.success(value))
        }
    }

    public static func getMovies(page: Int = 1,
                                 query: String,
                                 completion: @escaping (Result<[Movie], AppError>) -> Void) {

        guard let token = KeychainHelper.shared.readKeychainDataString(dataType: .bearerToken) else { return }

        let headers: HTTPHeaders = [
            .authorization(bearerToken: token)
        ]

        AF.request("\(APIServiceConstants.ApiURL)/movie/searchMovie/\(page)/\(query)",
                   method: .get,
                   headers: headers).responseDecodable(of: [Movie].self) { response in

            guard let value = response.value,
                  (200..<300).contains(response.response!.statusCode) else {
                completion(.failure(AppError(errorCode: response.response?.statusCode ?? 400,
                                             message: "result_failure")))
                return
            }

            completion(.success(value))
        }
    }

    public static func getUserFavoriteMovies(completion: @escaping (Result<[Movie], AppError>) -> Void) {

        guard let token = KeychainHelper.shared.readKeychainDataString(dataType: .bearerToken) else { return }

        let headers: HTTPHeaders = [
            .authorization(bearerToken: token)
        ]

        AF.request("\(APIServiceConstants.ApiURL)/movie/getUserMovieList",
                   method: .get,
                   headers: headers).responseDecodable(of: [Movie].self) { response in

            guard let value = response.value,
                  (200..<300).contains(response.response!.statusCode) else {
                completion(.failure(AppError(errorCode: response.response?.statusCode ?? 400,
                                             message: "result_failure")))
                return
            }

            completion(.success(value))
        }
    }

    public static func addMovieToFavoritesByID(ID: String, completion: @escaping (Result<String, AppError>) -> Void) {

        guard let token = KeychainHelper.shared.readKeychainDataString(dataType: .bearerToken) else { return }

        let headers: HTTPHeaders = [
            .authorization(bearerToken: token)
        ]

        AF.request("\(APIServiceConstants.ApiURL)/movie/addMovieById/\(ID)",
                   method: .put,
                   headers: headers).response { response in

            guard response.data != nil,
                  (200..<300).contains(response.response!.statusCode) else {
                completion(.failure(AppError(errorCode: response.response?.statusCode ?? 400,
                                             message: "result_failure")))
                return
            }

            completion(.success("result_success"))
        }
    }

    public static func removeMovieFromFavoritesByID(ID: String, completion: @escaping (Result<String, AppError>) -> Void) {

        guard let token = KeychainHelper.shared.readKeychainDataString(dataType: .bearerToken) else { return }

        let headers: HTTPHeaders = [
            .authorization(bearerToken: token)
        ]

        AF.request("\(APIServiceConstants.ApiURL)/movie/removeMovieById/\(ID)",
                   method: .delete,
                   headers: headers).response { response in

            guard response.data != nil,
                  (200..<300).contains(response.response!.statusCode) else {
                completion(.failure(AppError(errorCode: response.response?.statusCode ?? 400,
                                             message: "result_failure")))
                return
            }

            print(String(decoding: response.data!, as: UTF8.self))

            completion(.success("result_success"))
        }
    }
}
