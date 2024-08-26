//
//  FavoriteView.swift
//  DemoApp
//
//  Created by Raman Mann on 24/08/24.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        List{
            ForEach(0...20,id: \.self){
                Text("Favorite \($0)")
            }
        }.padding(.all,0)
            .background(.white)
            .listStyle(.plain)
    }
}

#Preview {
    FavoriteView()
}
