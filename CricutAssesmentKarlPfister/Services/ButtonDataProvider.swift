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
#warning("Unwrap properly, make snippets")
        let request = URLRequest(url: url!)
        let object = try await perform(request, type: CricutButtonTLD.self)
        return object.buttons
    }
}
