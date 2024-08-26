//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 23/08/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Image("scene").resizable().aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .clipped()
            .opacity(0.8)
            .overlay {
                        Image(systemName: "globe").font(.system(size: 50))
                            .foregroundColor(.green)
                            .shadow(color: .green, radius: 10,x: -2,y: 2)
               
            }
        
    }
}

#Preview {
    ContentView()
}


