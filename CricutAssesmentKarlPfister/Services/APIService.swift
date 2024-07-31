//
//  APIService.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import Foundation

/// An abstraction of the `URLSession.shared.DataTask` closure.
/// ```
/// func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkingError>) -> Void)
/// ```
///
/// - Parameters
///   - request: A URL request object that provides the URL, cache policy, request type, body data or body stream, and so on.
///   - completion: The completion handler to call when the `dataTask` request is complete. This completion handler takes the following  `ResultType` parameters:
///     - Data: The data returned by the server.
///     - NetworkingError: A custom error type
///
protocol APIDataProvidable {
    //func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkingError>) -> Void)
    func perform(_ request: URLRequest) async throws -> Data
}

extension APIDataProvidable {
    /// Extention of the `APIDataProvidable` protocol
    ///
    /// This is used to provide a default implementaion of the `.perform(_ request: URLRequest)` protocol method.
//    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkingError>) -> Void) {
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error {
//                completion(.failure(.thrownError(error)))
//            }
//            if let response = response as? HTTPURLResponse {
//                print("Completed with a response of", response.statusCode)
//            }
//            guard let data else {
//                completion(.failure(.noData)); return
//            }
//            completion(.success(data))
//        }.resume()
//    }
    
    func perform(_ request: URLRequest) async throws -> Data {
      let (data,response) = try await URLSession.shared.data(for: request)
        
        if let response = response as? HTTPURLResponse {
            print("DEBUG: HTTP Request response code: \(response.statusCode)")
        }
        
        return data
    }
}
