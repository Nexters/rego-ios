//
//  Router.swift
//  REGO
//
//  Created by kokojong on 2/19/24.
//

import Foundation
import Alamofire

final class Network {
    static let baseURL = "https://nexters-rego.com/api/"
}

enum Router: URLRequestConvertible {

    case fetchGames(tags: [String], category: String)
    case fetchDetails(ids: [Int64])
    case likeGame(id: Int64)
    case unlikeGame(id: Int64)

    var path: String {
        switch self {
        case .fetchGames:
            return "games"
        case .fetchDetails:
            return "games/detail"
        case .likeGame:
            return "like"
        case .unlikeGame:
            return "like"
        }
    }

    var url: URL {
        URL(string: Network.baseURL)!
    }

    var headers: HTTPHeaders {
        var defaultHeader: HTTPHeaders = [
            "Content-Type": "application/json",
            "deviceId": Utils.deviceID
        ]

        switch self {
        case .fetchGames, .fetchDetails, .likeGame, .unlikeGame:
            return defaultHeader
        }
    }

    var method: HTTPMethod {
        switch self {
        case .fetchGames, .fetchDetails:
            return .get
        case .likeGame:
            return .post
        case .unlikeGame:
            return .delete
        }
    }

    var parameters: [String: Any] {
        switch self {
        case .fetchGames(let tags, let category):
            return [
                "tagTypes": tags.joined(separator: ","),
                "homeCategory": category
            ]
        case .fetchDetails(ids: let ids):
            return [
                "gameUuid": ids.map{String($0)}.joined(separator: ",")
            ]
        case .likeGame(id: let id):
            return [
                "gameUuid": id
            ]
        case .unlikeGame(id: let id):
            return [
                "gameUuid": id
            ]
        }
    }

    func asURLRequest() throws -> URLRequest {
        var request = try URLRequest(url: url, method: method, headers: headers)

        if method == .post || method == .put {
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        }
        else if method == .get {
            let queryParams = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            print("queryParams", queryParams)
            request.url = components?.url
        }

        print("request is ", request, request.headers)

        return request
    }

}
