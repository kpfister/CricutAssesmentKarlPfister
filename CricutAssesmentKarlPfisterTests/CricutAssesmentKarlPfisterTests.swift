//
//  CricutAssesmentKarlPfisterTests.swift
//  CricutAssesmentKarlPfisterTests
//
//  Created by Karl Pfister on 7/30/24.
//

import XCTest
@testable import CricutAssesmentKarlPfister

final class CricutAssesmentKarlPfisterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

struct MockDataProvider: ButtonDataProvidable {
    var shouldThrowError: Bool = false
    func fetchShapes(from url: String) async throws -> [CricutButton] {
        if shouldThrowError {
            throw NetworkingError.noData
        } else {
            return [
                // add objs for tests
            ]
        }
    }
}
