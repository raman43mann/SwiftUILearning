//
//  HomeModel.swift
//  DemoApp
//
//  Created by Raman Mann on 25/08/24.
//

import Foundation

struct EmployeeBaseModel :Codable{
    let status : String?
    let message : String?
    let data : [EmployeeDataModel]?
}

struct EmployeeDataModel:Codable{
    let id : Int?
    let employee_name : String?
    let employee_salary : Int?
    let employee_age : Int?
    let profile_image : String?
    
}
