//
//  MediaMixerTests.swift
//  MediaMixerTests
//
//  Created by asmaa gamal  on 27/12/2023.
//

import XCTest
@testable import MediaMixer

final class MediaMixerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//    func test_SearchQuery() {
//           let mockNetworkManager = MockNetworkManager()
//
//           // Simulate the search button action
//           let query = "Test Song"
//           mockNetworkManager.search(query: query)
//
//           // Assert that the search function was called with the correct query
//           XCTAssertEqual(mockNetworkManager.lastSearchedQuery, query)
//       }
    
    func testEmptyQueryWillThrow() {
        let mockNetworkManager = MockNetworkManager()
        let emptyQuery = ""

        XCTAssertThrowsError(try mockNetworkManager.search(query: emptyQuery)) { error in
            guard let mockError = error as? MockNetworkManager.MockError else {
                XCTFail("Unexpected error type")
                return
            }

            XCTAssertEqual(mockError, MockNetworkManager.MockError.emptyQuery, "Expected EmptyQuery error")
        }
    }
    
//    func testfail(){
//        XCTFail()
//    }

}
