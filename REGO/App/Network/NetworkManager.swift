//
//  NetworkManager.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import Foundation
import Alamofire

final class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    func request<T: Decodable>(type: T.Type, api: Router) async throws -> T {

        let dataTask = try AF.request(api.asURLRequest()).serializingDecodable(type)

        switch await dataTask.result {
        case .success(let result):
            guard let response = await dataTask.response.response else {
                throw RequestError.unknown
            }
            print("response", response)
            print("result", result)
            return result
        case .failure(let error):
            print("error", error)
            throw error
        }
    }
}

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown

    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
