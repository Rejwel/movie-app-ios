//
//  Keychain.swift
//  movie-app-ios
//
//  Created by Paweł on 13/11/2022.
//

import Foundation

public class KeychainHelper {

    enum KeychainData: String {
        case bearerToken = "bearer-token"
        case refreshToken = "refresh-token"
        case tokenExpirationTime = "token-expiration-time"
    }

    static let shared = KeychainHelper()
    private init() {}

    // MARK: main methods

    private func save(_ data: Data, service: String, account: String) {

        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary

        let status = SecItemAdd(query, nil)

        if status == errSecDuplicateItem {
                let query = [
                    kSecAttrService: service,
                    kSecAttrAccount: account,
                    kSecClass: kSecClassGenericPassword
                ] as CFDictionary

                let attributesToUpdate = [kSecValueData: data] as CFDictionary

                SecItemUpdate(query, attributesToUpdate)
            }
    }

    private func read(service: String, account: String) -> Data? {

        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary

        var result: AnyObject?
        SecItemCopyMatching(query, &result)

        return (result as? Data)
    }

    private func delete(service: String, account: String) {

        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword
            ] as CFDictionary

        SecItemDelete(query)
    }

    func saveAppTokenToKeychain(_ appToken: AppToken) {

        saveKeychainDataString(dataType: .bearerToken, dataString: appToken.accessToken)
        saveKeychainDataString(dataType: .refreshToken, dataString: appToken.refreshToken)

        // TODO: Check and add if possible
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .medium
//        let expirationDate = Date(timeIntervalSince1970: TimeInterval(userCredentials.expirationTime) / 1000) + TimeInterval(TimeZone.current.secondsFromGMT())
//
//        saveKeychainDataString(dataType: .tokenExpirationTime, dataString: formatter.string(from: expirationDate))
    }

    // MARK: read / delete items in keyhchain

    func readKeychainDataString(dataType: KeychainData) -> String? {
        guard let data = KeychainHelper.shared.read(service: dataType.rawValue, account: "MovieApp") else {
//            print("Faled to read \(dataType.rawValue) from keychain")
            return nil
        }
        guard let dataString = String(data: data, encoding: .utf8) else {
//            print("Faled to read string from \(dataType.rawValue) in keychain")
            return nil
        }

        return dataString
    }

    func saveKeychainDataString(dataType: KeychainData, dataString: String) {
        KeychainHelper.shared.save(Data(dataString.utf8), service: dataType.rawValue, account: "MovieApp")
    }

    func deleteKeychainData(dataType: KeychainData) {
        KeychainHelper.shared.delete(service: dataType.rawValue, account: "MovieApp")
    }

}
