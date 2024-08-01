//
//  APIService.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import Foundation

/// An abstraction of the `URLSession.shared.data(for: request) Async Await`
/// ```
/// perform<Object: Decodable>(_ request: URLRequest, type: Object.Type) async throws -> Object
/// ```
///
/// - Parameters
///   - request: A URL request object that provides the URL, cache policy, request type, body data or body stream, and so on.

protocol APIDataProvidable {
    func perform<Object: Decodable>(_ request: URLRequest, type: Object.Type) async throws -> Object
}

extension APIDataProvidable {
    /// Extention of the `APIDataProvidable` protocol
    ///
    /// This is used to provide a default implementaion of the `.perform(_ request: URLRequest)` protocol method.
    func perform<Object: Decodable>(_ request: URLRequest, type: Object.Type) async throws -> Object {
      let (data,response) = try await URLSession.shared.data(for: request)
        
        if let response = response as? HTTPURLResponse {
            print("DEBUG: HTTP Request response code: \(response.statusCode)")
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let object = try decoder.decode(Object.self, from: data)
            return object
        } catch {
            throw NetworkingError.unableToDecode
        }
    }
}
