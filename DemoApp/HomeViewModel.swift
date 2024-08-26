//
//  HomeViewModel.swift
//  DemoApp
//
//  Created by Raman Mann on 25/08/24.
//

import Foundation


class HomeViewModel : ObservableObject{
    
    // Published use to notify when new value added or updated from class type
    @Published var employoeeData : [EmployeeDataModel]?
    @Published var errorMessage : String?
    @Published var searchText: String = ""

    
    func getEmployee(){
                let endpoint = APIEndpoint.getEmployees
                let responseHandler = JSONResponseHandler<EmployeeBaseModel>()

                APIManager.shared.performGETRequest(endpoint: endpoint, responseHandler: responseHandler) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let userData):
                            if let employeData = userData.data{
                                self.employoeeData = employeData
                            }else{
                                self.errorMessage = userData.message
                            }
                        case .failure(let error):
                            self.errorMessage = error.localizedDescription
                        }
                    }
                }
            }
}
