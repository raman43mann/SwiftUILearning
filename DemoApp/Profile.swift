//
//  Profile.swift
//  DemoApp
//
//  Created by Raman Mann on 25/08/24.
//

import SwiftUI

struct Profile: View {
    @State private var name = ""
    @State private var email = ""
    @State private var image = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            VStack{
                Image("scene")
                    .frame(width: 120,height: 120)
                    .clipShape(Circle())
                    .padding(.top,30)
                    .padding(.bottom,80)
                
                VStack(spacing:25){
                    TextFieldView(placeHolder: "Name", icon:  "person.crop.circle.fill", type: $name, isSecure: false)
                    TextFieldView(placeHolder: "Email", icon:  "envelope.fill", type: $name, isSecure: false)
                    TextFieldView(placeHolder: "DOB", icon:  "calendar", type: $name, isSecure: false)
                }
                .padding(.horizontal,40)
                .padding(.bottom,60)
                
                CustomButton(title: "Update") {
                    
                }.padding(.horizontal,40)
                .padding(.bottom,20)
                
                
            }
        }
        .navigationTitle("Profile")
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                         // Adding text for better accessibility
                    }
                }
            }
        
        }
        .toolbar(.hidden,for: .tabBar)
    }
}

#Preview {
    Profile()
}
