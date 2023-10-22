//
//  ValidationDeepLinkUrlTest.swift
//  WikiLocationTests
//
//  Created by Nikita Gil on 22.10.2023.
//

import XCTest

@testable import WikiLocation

final class ValidationDeepLinkUrlTest: XCTestCase {

    func testThatViewModelOpensValidDeepLinkForTextPlace() {
        let viewModel = LocationsViewViewModel()
        let url = viewModel.openLocation(name: "Kyiv")
        
        XCTAssertEqual(url.absoluteString, "wikipedia://places?WMFArticleURL=https://en.wikipedia.org/kyiv")
    }

    func testThatViewModelOpensValidDeepLinkForCoordinate() {
        let viewModel = LocationsViewViewModel()
        let item = LocationItem(name: nil, lat: 1.1, long: 2.2)
        let url = viewModel.openLocation(locationItem: item)
        
        XCTAssertEqual(url.absoluteString, "wikipedia://places?WMFArticleURL=https://en.wikipedia.org/latitude=\(1.1)_longtitude=\(2.2)")
    }

}

