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
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        let data = try await perform(request)
        do {
            let decoder = JSONDecoder()
            let buttons = try decoder.decode(CricutButtonTLD.self, from: data)
            return buttons.cricutButtons
        } catch {
            throw NetworkingError.unableToDecode
        }
    }
}
