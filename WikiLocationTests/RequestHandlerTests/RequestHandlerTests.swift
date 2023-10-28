//
//  RequestHandlerTests.swift
//  WikiLocationTests
//
//  Created by Nikita Gil on 28.10.2023.
//

import XCTest
@testable import WikiLocation

final class RequestHandlerTests: XCTestCase {
    
    var dataParser: DataParser! = nil
    var locations: LocationContainer! = nil

    override func setUpWithError() throws {
        try super.setUpWithError()
        dataParser = DataParser()
        guard let data = RequestHandlerTests.getDataFromJSONFile(with: "locations") else {
            XCTFail("Data nil")
            return
        }
        guard let locations: LocationContainer = try dataParser.parse(data: data) else {
            XCTFail("Error parser")
            return
        }
        self.locations = locations
    }

    override func tearDownWithError() throws {
        dataParser = nil
        locations = nil
        try super.tearDownWithError()
    }
}

extension RequestHandlerTests {
    
    static func getDataFromJSONFile(with name: String) -> Data? {
        guard let pathString = Bundle(for: self).path(forResource: name, ofType: "json") else {
            XCTFail("Mock JSON file \(name).json not found")
            return nil
        }

        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            return nil
        }

        guard let jsonData = jsonString.data(using: .utf8) else {
            return nil
        }
        return jsonData
    }
    
    func testParse() {
        
        XCTAssertEqual(locations.locations.count, 4)
        XCTAssertEqual(locations.locations[0].name, "Amsterdam")
        XCTAssertEqual(locations.locations[0].lat, 52.3547498)
        XCTAssertEqual(locations.locations[0].long, 4.8339215)
        XCTAssertNil(locations.locations.last?.name)
    }
}
