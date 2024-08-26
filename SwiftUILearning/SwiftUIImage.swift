//
//  SwiftUIImage.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 23/08/24.
//

import SwiftUI

struct SwiftUIImage: View {
    var body: some View {
            Image("scene").resizable().aspectRatio(contentMode: .fill)
                .clipped()
                .opacity(0.8)
                .overlay {
                    Image(systemName: "globe").font(.system(size: 50))
                        .foregroundColor(.green)
                    
                        .shadow(color: .green, radius: 10,x: -2,y: 2)
                        
                        
                    
                }.ignoresSafeArea()
            
        }
    }

#Preview {
    SwiftUIImage()
}