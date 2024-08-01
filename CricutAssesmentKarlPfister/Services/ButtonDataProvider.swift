//
//  ShapeDataProvider.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import Foundation

protocol ButtonDataProvidable {
    func fetchShapes(from url: String) async throws -> [CricutButton]
}

struct ButtonDataProvider: ButtonDataProvidable, APIDataProvidable {
    func fetchShapes(from url: String) async throws -> [CricutButton] {
        guard let url = URL(string: url) else {
            throw NetworkingError.invalidURL
        }
        let request = URLRequest(url: url)
        let object = try await perform(request, type: CricutButtonTLD.self)
        return object.buttons
    }
}
