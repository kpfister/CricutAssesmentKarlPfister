//
//  UnitTestingNetworkError_Tests.swift
//  CricutAssesmentKarlPfisterTests
//
//  Created by Karl Pfister on 8/1/24.
//

import XCTest
@testable import CricutAssesmentKarlPfister

final class UnitTestingNetworkError_Tests: XCTestCase {

    func test_InvalidURLError_Description() {
          // Given
          let error = NetworkingError.invalidURL
          
          // When
          let description = error.errorDescription
          
          // Then
          XCTAssertEqual(description, "Invalid URL. Check your endpoint.")
      }

      func test_ThrownError_Description() {
          // Given
          let underlyingError = NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Test error"])
          let error = NetworkingError.thrownError(underlyingError)
          
          // When
          let description = error.errorDescription
          
          // Then
          XCTAssertEqual(description, "Thrown error. Error was Test error")
      }

      func test_NoDataError_Description() {
          // Given
          let error = NetworkingError.noData
          
          // When
          let description = error.errorDescription
          
          // Then
          XCTAssertEqual(description, "No data received from successful network fetch.")
      }

      func test_UnableToDecode_ErrorDescription() {
          // Given
          let error = NetworkingError.unableToDecode
          
          // When
          let description = error.errorDescription
          
          // Then
          XCTAssertEqual(description, "Unable to decode model object from data.")
      }

      func test_InvalidStatusCode_ErrorDescription() {
          // Given
          let error = NetworkingError.invalidStatusCode
          
          // When
          let description = error.errorDescription
          
          // Then
          XCTAssertEqual(description, "Fetch returned an unsuccessful status code. Code was not 200.")
      }
}
