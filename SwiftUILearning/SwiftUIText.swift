//
//  SwiftUIView.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 23/08/24.
//

import SwiftUI

struct SwiftUIText: View {
    var body: some View {
        Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don ’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
            .fontWeight(.semibold)
            .font(.system(size: 25))
            .foregroundColor(Color.red)
            .multilineTextAlignment(.center)
            .lineLimit(5).truncationMode(.tail)
            .lineSpacing(5)
        
            .padding(EdgeInsets(top: 20, leading: 40, bottom: 40, trailing: 40))
            .background(Color.black)
            .cornerRadius(20)
        
    }
}

#Preview {
    SwiftUIText()
}
