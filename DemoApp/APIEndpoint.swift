//
//  ApiEndPoints.swift
//  DemoApp
//
//  Created by Raman Mann on 25/08/24.
//

import Foundation

enum APIEndpoint {
    case getEmployees
    case getSingleEmployee(id: Int)
    
    var baseURL : String {
        let isLiveApp = true
        
        if isLiveApp{
            return "https://dummy.restapiexample.com/api/v1/"
        }else{
            return "https://dummy.restapiexample.com/api/v1/"
        }
    }
    var urlString: String {
        switch self {
        case .getEmployees:
            return "employees"
        case .getSingleEmployee(let id):
            return "employees\(id)"
        }
    }
    
    var url: URL? {
        return URL(string: self.baseURL + self.urlString)
    }
}
