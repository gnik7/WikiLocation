//
//  NetworkError.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import Foundation

public enum NetworkError: LocalizedError {
    case noData
    case invalidServerResponse
    case invalidURL
    
    public var errorDescription: String? {
        switch self {
            case .invalidServerResponse:
              return "The server returned an invalid response."
            case .invalidURL:
              return "URL string is malformed."
            case .noData:
                return "No data received from the server. Please try again later"
            }
    }
}
