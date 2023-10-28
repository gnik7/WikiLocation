//
//  DataLoadErrorTests.swift
//  WikiLocationTests
//
//  Created by Nikita Gil on 28.10.2023.
//

import XCTest
@testable import WikiLocation

final class DataLoadErrorTests: XCTestCase {

    func testDataLoadError() throws {
        XCTAssertEqual(NetworkError.noData.errorDescription, "No data received from the server. Please try again later")
        XCTAssertEqual(NetworkError.invalidServerResponse.errorDescription, "The server returned an invalid response.")
        XCTAssertEqual(NetworkError.invalidURL.errorDescription, "URL string is malformed.")
    }
}
