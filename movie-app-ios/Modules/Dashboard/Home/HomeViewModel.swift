//
//  HomeModel.swift
//  movie-app-ios
//
//  Created by Paweł on 09/11/2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {

    @Published var user: User?

    init() {
        fetchUser()
    }

    public func fetchUser() {

        KeychainHelper.shared.checkIfTokenExpiredAndExtend {
            APIService.getUser { [weak self] res in
                switch res {
                case .success(let success):
                    self?.user = success
                case .failure:
                    break
                }
            }
        }
    }

    public func fetchMovies(completion: @escaping ([Movie]) -> Void) {

        KeychainHelper.shared.checkIfTokenExpiredAndExtend {
            APIService.getMovies(query: "Black%20Panther") { res in
                switch res {
                case .success(let success):
                    completion(success.filter { $0.posterPath != "" })
                case .failure(let failure):
                    print(failure)
                    completion([])
                }
            }
        }
    }

    public func fetchMoviesByQuery(query: String,
                                   completion: @escaping ([Movie]) -> Void) {

        guard query.count > 0 else { return }
        let queryForRequest = query.replacingOccurrences(of: " ", with: "%20")
        KeychainHelper.shared.checkIfTokenExpiredAndExtend {
            APIService.getMovies(query: queryForRequest) { res in
                switch res {
                case .success(let success):
                    completion(success)
                case .failure(let failure):
                    print(failure)
                    completion([])
                }
            }
        }
    }
}
