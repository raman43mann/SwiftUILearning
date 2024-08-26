//
//  ApiManager.swift
//  DemoApp
//
//  Created by Raman Mann on 25/08/24.
//

import Foundation

class APIManager {
    static let shared = APIManager() // Singleton instance
    private init() {} // Private init to enforce singleton
    
    func performGETRequest<T: Decodable>(endpoint: APIEndpoint, responseHandler: JSONResponseHandler<T>, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        var headers = [String: String]()
        headers["Content-Type"] = "application/json"
        debugPrint(url, headers)
        
        var request = URLRequest(url: url)
                request.httpMethod = "GET"
                
      
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            responseHandler.handleResponse(data: data, response: response, error: error, completion: completion)
        }.resume()
    }
}
