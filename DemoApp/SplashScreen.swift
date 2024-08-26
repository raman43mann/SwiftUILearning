//
//  SplashScreen.swift
//  DemoApp
//
//  Created by Raman Mann on 25/08/24.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var isAppLaunching : Bool
    @State private var scale = 0.5
    var body: some View {
        VStack{
            VStack {
                
                Text("Welcome\nRaman")
                    .font(.system(size: 50,weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                
            }
            .scaleEffect(scale)
                .onAppear{
                    withAnimation(.easeIn(duration: 0.7)) {
                        self.scale = 0.9
                    }
                }
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
          )
        .background(.red)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.isAppLaunching = true
                }
            }
        }
    }
}

//#Preview {
//    SplashScreen()
//}
