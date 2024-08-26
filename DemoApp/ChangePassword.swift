//
//  ChangePassword.swift
//  DemoApp
//
//  Created by Raman Mann on 25/08/24.
//

import SwiftUI

struct ChangePassword: View {
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 20) { // Increased spacing for better separation
                Image("scene")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .padding(.top, 30)
                    .padding(.bottom, 40) // Reduced bottom padding for better balance
                
                VStack(spacing: 25) { // Ensure consistent spacing between fields
                    TextFieldView(placeHolder: "Old Password", icon: "lock.fill", type: $oldPassword, isSecure: true)
                    TextFieldView(placeHolder: "New Password", icon: "lock.fill", type: $newPassword, isSecure: true)
                    TextFieldView(placeHolder: "Confirm Password", icon: "lock.fill", type: $confirmPassword, isSecure: true)
                }.padding(.bottom,80)
                .padding(.horizontal, 40) // Add horizontal padding to text fields

                CustomButton(title: "Submit") {
                    // Action for the submit button
                }.padding(.horizontal,40)
                .padding(.bottom, 20) // Added bottom padding for space from other elements
            }
         
            .navigationTitle("Change Password")
            .navigationBarBackButtonHidden()
            .toolbar {
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
        }
    }
}

#Preview {
    ChangePassword()
}


