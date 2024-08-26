//
//  CustomButton.swift
//  DemoApp
//
//  Created by Raman Mann on 25/08/24.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action:() -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(minWidth: 50,maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .font(.system(size: 17,weight: .medium))
                .cornerRadius(30)
        }
       
    }
}

#Preview {
    CustomButton(title: "Done") {
        
    }
}
