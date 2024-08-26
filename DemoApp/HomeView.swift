//
//  HomeView.swift
//  DemoApp
//
//  Created by Raman Mann on 24/08/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        VStack{
            
            if let data = viewModel.employoeeData{
                List(data,id: \.id){
                    item in
                    ListItemCell(item: item)
                }.padding(.all,0)
                    .background(.white)
                    .listStyle(.plain)
                
            }else{
                Text("No Data Found!")
                    .lineLimit(4)
                
            }
        
        }.onAppear{
            viewModel.getEmployee()
        }.toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    
                }, label: {
                    
                    Image(systemName: "text.justify")
                        .onTapGesture {
                            
                        }
                })
            }
        }
        .searchable(text: $viewModel.searchText,placement: .toolbar,prompt: "Search...")
    }
}

#Preview {
    HomeView()
}


struct ListItemCell: View {
    var item : EmployeeDataModel
    var body: some View {
        HStack {
            VStack {
                Image("scene")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(5)
                Spacer()
            }.padding(.top,10)
            
            VStack(alignment: .leading){
                Text(item.employee_name ?? "")
                    .lineLimit(1)
                Text("Salary \(item.employee_salary ?? 0)")
                    .lineLimit(2)
            }
        }
    }
}
