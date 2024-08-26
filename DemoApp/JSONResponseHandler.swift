//
//  ResponseParser.swift
//  DemoApp
//
//  Created by Raman Mann on 25/08/24.
//

import Foundation

protocol ResponseHandler {
    associatedtype DataType: Decodable
    func handleResponse(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<DataType, Error>) -> Void)
}

class JSONResponseHandler<T: Decodable>: ResponseHandler {
    typealias DataType = T
    
    func handleResponse(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<T, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
            return
        }

        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        } catch let decodingError {
            debugPrint(decodingError)
            completion(.failure(decodingError))
        }
    }
}
