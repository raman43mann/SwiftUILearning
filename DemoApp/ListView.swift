//
//  ListView.swift
//  DemoApp
//
//  Created by Raman Mann on 24/08/24.
//

import SwiftUI

struct ListView: View {
    // Calculate the width and height of each item based on the device's screen size
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let itemSpacing: CGFloat = 10
    
    
    
    var body: some View {
        // Calculate the width of each item, accounting for spacing between items
        let itemWidth = (screenWidth - (itemSpacing*3)) / 2
        
        // Calculate the height of each item, accounting for spacing between items
        let itemHeight = (screenHeight - (itemSpacing*4)) / 4
        
        // Define the grid layout with two columns
        let columns: [GridItem] = [
            GridItem(.fixed(itemWidth), spacing: itemSpacing),
            GridItem(.fixed(itemWidth), spacing: itemSpacing)
        ]
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: itemSpacing) {
                ForEach(0..<20) { index in
                    VStack {
                        Text("Item \(index)")
                            .font(.headline)
                            .frame(width: itemWidth, height: itemHeight)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
    }
}
#Preview {
    ListView()
}
