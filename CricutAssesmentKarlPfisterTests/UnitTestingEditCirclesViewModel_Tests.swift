//
//  UnitTestingEditCirclesViewModel_Tests.swift
//  CricutAssesmentKarlPfisterTests
//
//  Created by Karl Pfister on 8/1/24.
//

import XCTest
import SwiftUI
@testable import CricutAssesmentKarlPfister

final class UnitTestingEditCirclesViewModel_Tests: XCTestCase {
    
    private var sut: EditCirclesViewModel!
    /// The underlying SOT for the `shapes` that the `sut` will manipulate
    private var shapesSOT: [CricutShape]!
    private var shapesBinding: Binding<[CricutShape]>!
    
    override func setUpWithError() throws {
        // Initialize the backing store with initial data
        shapesSOT = [
            CricutShape(type: .circle),
            CricutShape(type: .circle),
            CricutShape(type: .circle),
            CricutShape(type: .triangle),
            CricutShape(type: .triangle),
            CricutShape(type: .triangle),
            CricutShape(type: .square),
            CricutShape(type: .square)
        ]
        // Create a binding to the backing store
        shapesBinding = Binding(get: {
            // This ensures that any reads from the binding reflect the current state of shapesBackingStore.
            return self.shapesSOT
        }, set: {
            // updates `shapesSOT` with the new value passed to the binding
            self.shapesSOT = $0
        })
        // Initialize the view model with the shapes binding
        sut = EditCirclesViewModel(gridShapes: shapesBinding)
    }
    
    override func tearDownWithError() throws {
        // Reset the SOT to the initial state
        shapesSOT = [
            CricutShape(type: .circle),
            CricutShape(type: .circle),
            CricutShape(type: .circle),
            CricutShape(type: .triangle),
            CricutShape(type: .triangle),
            CricutShape(type: .triangle),
            CricutShape(type: .square),
            CricutShape(type: .square)
        ]
    }
    
    // Test the removeAllCircles method
    func test_RemoveAllCircles() {
        // When
        sut.removeAllCircles()
        let circleCount = sut.gridShapes.filter({$0.type == .circle}).count
        
        // Then
        XCTAssertEqual(circleCount, 0)
        XCTAssertTrue(sut.gridShapes.contains(where: {$0.type != .circle}), "Only non-circle shapes should remain")
    }
    
    // Test the removeLastCircle method
    func test_RemoveLastCircle() {
        // When
        let finalCircle = sut.gridShapes.last(where: {$0.type == .circle})
        let finalCircleUUID = finalCircle?.id
        let circleCount = sut.gridShapes.filter({$0.type == .circle}).count
        
        sut.removeLastCircle()
        // Then
        XCTAssertFalse(sut.gridShapes.contains(where: {$0.id == finalCircleUUID}), "There should not a circle with this UUID")
        XCTAssertEqual(sut.gridShapes.filter { $0.type == .circle }.count, circleCount - 1, "There should be one less circle")
    }
    
    // Test the addShape method
    func test_AddShape_onlyAddsOneCircle() {
        // When
        let startingCircleCount = sut.gridShapes.filter({$0.type == .circle}).count
        sut.addShape(ofType: .circle)
        let finalCircleCount = sut.gridShapes.filter({$0.type == .circle}).count
        // Then
        XCTAssertEqual(sut.gridShapes.last?.type, .circle, "The last shape should be a circle")
        XCTAssertLessThan(startingCircleCount, finalCircleCount)
        
    }
}
