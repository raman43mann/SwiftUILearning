//
//  SwiftUIAnimation.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 24/08/24.
//

import SwiftUI
struct SwiftUIAnimation: View {
    
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200) .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.3)) {
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
                self.heartSizeChanged.toggle()
            }
            
        }
    }
    
}
#Preview {
    SwiftUIAnimation()
}
