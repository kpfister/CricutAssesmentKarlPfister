//
//  UnitTestingMainGridViewModel_Tests.swift
//  CricutAssesmentKarlPfisterTests
//
//  Created by Karl Pfister on 8/1/24.
//

import XCTest
@testable import CricutAssesmentKarlPfister

final class UnitTestingMainGridViewModel_Tests: XCTestCase {
    
    private var sut: MainGridViewModel!
    private var mockService: MockButtonDataProvider!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockService = MockButtonDataProvider()
        sut = MainGridViewModel(service: mockService)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockService = nil
    }
    
    // Test fetchButtons method
    func test_FetchButtons_Success() async {
        // Given
        let expectedButtons = [CricutButton(name: "Test Circle", drawPath: .circle),
                               CricutButton(name: "Test Square", drawPath: .square),
                               CricutButton(name: "Test Triangle", drawPath: .triangle)
        ]
        
        mockService.fetchShapesMockResult = .success(expectedButtons)
        
        // When
        await sut.fetchButtons()
        
        // Then
        XCTAssertEqual(sut.buttons, expectedButtons, "The fetched buttons should match the expected buttons")
    }
    
    func test_FetchButtons_Failure() async {
        // Given
        let expectedError = NSError(domain: "TestError", code: 1, userInfo: nil)
        mockService.fetchShapesMockResult = .failure(expectedError)
        
        // When
        await sut.fetchButtons()
        
        // Then
        XCTAssertNil(sut.buttons, "The buttons should be nil on fetch failure")
    }
    
    // Test clearAllShapes method
    func testClearAllShapes() {
        // Given
        sut.gridShapes = [
            CricutShape(type: .circle),
            CricutShape(type: .triangle)
        ]
        
        // When
        sut.clearAllShapes()
        
        // Then
        XCTAssertTrue(sut.gridShapes.isEmpty, "The gridShapes array should be empty after clearing all shapes")
    }
    
    // Test addShape method
    func testAddShape() {
        // Given
        let initialShapeCount = sut.gridShapes.count
        
        // When
        sut.addShape(ofType: .circle)
        
        // Then
        XCTAssertEqual(sut.gridShapes.count, initialShapeCount + 1, "The gridShapes array should have one more shape")
        XCTAssertEqual(sut.gridShapes.last?.type, .circle, "The last shape in the array should be a circle")
    }
    
}
