//
//  UnitTestingCricutTriangle_Tests.swift
//  CricutAssesmentKarlPfisterTests
//
//  Created by Karl Pfister on 8/1/24.
//

import XCTest
import SwiftUI

@testable import CricutAssesmentKarlPfister

final class UnitTestingCricutTriangle_Tests: XCTestCase {

    func test_PathWithSquareRect() {
        // Given
        let randomSize = Int.random(in: 10..<100)
        let triangle = CricutTriangle()
        let rect = CGRect(x: 0, y: 0, width: randomSize, height: randomSize)
        
        // When
        let path = triangle.path(in: rect)
        
        // Then
        let expectedPath = Path { path in
            // .move sets the starting point of the path.
            // Starting Point: Middle of the top edge
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            // First Line: From the starting point to the bottom right corner
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            // Second Line: From the bottom right corner to the bottom left corner (rect.minX, rect.maxY)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            // Closing the Path: Draws the final line from the bottom left corner back to the starting point, forming a closed triangular shape
            path.closeSubpath()
        }
        
        XCTAssertEqual(path, expectedPath, "The path for a square rect should form a equalateral triangle")
    }
}
