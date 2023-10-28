//
//  URLRequestCreateTest.swift
//  WikiLocationTests
//
//  Created by Nikita Gil on 28.10.2023.
//

import XCTest
@testable import WikiLocation

final class URLRequestCreateTest: XCTestCase {

    var request: URLRequest!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        request = try LocationsRequest.loadLocations.createURLRequest()
    }

    override func tearDownWithError() throws {
        request = nil
        try super.tearDownWithError()
    }

    func testURLRequestCreate() {
        XCTAssertEqual(request.url?.absoluteString ,
                       "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json")
        XCTAssertEqual(request.url?.host() , "raw.githubusercontent.com")
        XCTAssertEqual(request.url?.path(), "/abnamrocoesd/assignment-ios/main/locations.json")
        XCTAssertEqual(request.httpMethod, "GET")
    }
}


