//
//  TextFieldView.swift
//  DemoApp
//
//  Created by Raman Mann on 25/08/24.
//

import SwiftUI

struct TextFieldView: View {
    var placeHolder : String
    var icon : String
    @Binding var type : String
    @State var isSecure : Bool
    var body: some View {
        VStack{
            HStack{
                Image(systemName:"lock.fill")
                    .padding(.trailing,15)
                    .frame(width: 20,height: 20)
                if isSecure{
                    SecureField(placeHolder, text: $type)
                        .font(.system(size: 16))
                }else{
                    TextField(placeHolder, text: $type)
                        .font(.system(size: 16))
                }
                    
            }
            Divider().padding(.leading,30).padding(.bottom,10)
        }
    }
}


