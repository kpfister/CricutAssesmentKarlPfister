//
//  MockButtonDataProvider.swift
//  CricutAssesmentKarlPfisterTests
//
//  Created by Karl Pfister on 8/1/24.
//

import XCTest
@testable import CricutAssesmentKarlPfister

/// Mock service that conforms to `ButtonDataProvidable` to simulate the behavior of the `ButtonDataProvider`
final class MockButtonDataProvider: ButtonDataProvidable {
    
    var fetchShapesMockResult: Result<[CricutButton], Error>?
    
    func fetchShapes(from url: String) async throws -> [CricutButton] {
        switch fetchShapesMockResult {
        case .success(let buttons):
            return buttons
        case .failure(let failureError):
            throw failureError
        case .none:
            return []
        }
    }
}
