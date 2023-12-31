//
//  APIManager.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import Foundation

protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol) async throws -> Data
}

class APIManager: APIManagerProtocol {
    
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())
        
        if data.isEmpty  {
            throw NetworkError.noData
        }
   
        guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else { throw NetworkError.invalidServerResponse }
        return data
    }
}
