//
//  RequestManager.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import Foundation

protocol RequestManagerProtocol {
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {
  
  let apiManager: APIManagerProtocol
  let parser: DataParserProtocol

  
  init(
    apiManager: APIManagerProtocol = APIManager(),
    parser: DataParserProtocol = DataParser()
  ) {
    self.apiManager = apiManager
    self.parser = parser
  }
  
  func perform<T>(_ request: RequestProtocol) async throws -> T where T : Decodable {
   
    let data = try await apiManager.perform(request)
    
    let decoded: T = try parser.parse(data: data)
    return decoded
  }
}

