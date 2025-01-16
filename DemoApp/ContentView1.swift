//
//  temp.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 04/12/24.
//

import SwiftUICore
import SwiftUI

struct ContentView1: View {
    @State private var progress = 0.5
    
    var body: some View {
        Gauge(value: progress, in: 0...1) {
            Text("Speed")
        } currentValueLabel: {
            Text("\(Int(progress * 100))%")
        }
        .gaugeStyle(.accessoryCircular)
        .padding()
    }
}

#Preview {
    ContentView1()
}
