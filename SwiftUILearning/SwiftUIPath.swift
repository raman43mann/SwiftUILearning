//
//  SwiftUIPath.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 24/08/24.
//

import SwiftUI

struct SwiftUIPath: View {
    var body: some View {
        
        Path(){
            path in
            path.move(to: CGPoint(x: 40, y: 20))
            path.addLine(to: CGPoint(x: 40, y: 20))
            path.addLine(to: CGPoint(x: 200, y: 20))
            path.addLine(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 40, y: 200))
        }.fill(.red)
        
        
        Path(){
            path in
            path.move(to: CGPoint(x: 40, y: 20))
            path.addLine(to: CGPoint(x: 40, y: 20))
            path.addLine(to: CGPoint(x: 200, y: 20))
            path.addLine(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 40, y: 200))
            path.closeSubpath()
        }.stroke(Color.green,lineWidth: 10)
          
        Path() { path in
        path.move(to: CGPoint(x: 20, y: 60))
        path.addLine(to: CGPoint(x: 40, y: 60))
        path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0)) 
        path.addLine(to: CGPoint(x: 230, y: 60))
        path.addLine(to: CGPoint(x: 230, y: 100))
        path.addLine(to: CGPoint(x: 20, y: 100))
        }
        .fill(Color.purple)
        
        Path(){
            path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 40, y: 20))
            path.addQuadCurve(to: CGPoint(x: 180, y: 20), control: CGPoint(x: 100, y: 80))
            path.addLine(to: CGPoint(x: 200, y: 20))
            path.addLine(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            path.closeSubpath()
        }.fill(Color.green)
        
    }
}

#Preview {
    SwiftUIPath()
}
