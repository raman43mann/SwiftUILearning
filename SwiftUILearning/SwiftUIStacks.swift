//
//  SwiftUIStacks.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 23/08/24.
//

import SwiftUI

struct SwiftUIStacks: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        NavigationView{
            VStack(spacing:5)
            {
                HStack(spacing:5) {
                    HeaderView()
                    Spacer()
                }.padding(20)
                
                
                HStack(spacing: 20){
                    Plans(title: "Basic", price: "$9", validityText: "per month", textColor: .black, bgColor: .yellow)
                    ZStack {
                        Plans(title: "Pro", price: "$90", validityText: "per month", textColor: .white, bgColor: .orange)
                        
                        Text("Premium").fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .background(Color.red)
                            .padding(10)
                            .offset(x:0,y:-80)
                        
                        
                    }
                }
                .padding(.horizontal,20)
                .padding(.bottom,0)
                
                
                Plans(title: "Pro offer", price: "$60/month", validityText: "per year", textColor: .white, bgColor: .orange)
                    .padding(20)
                
                
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .navigation) {
                    Button(action : {
                    // action
                        dismiss()
                    }){
                        HStack{
                            Text(Image(systemName: "chevron.left"))
                            
                            
                        }
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Detail")
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            
        } .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        
        
    }
}
#Preview {
    SwiftUIStacks()
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 5){
            Text("Choose")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            Text("Your Plan")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
        }
    }
}

struct BasicPlan: View {
    
    var body: some View {
        VStack {
            Text("Basic")
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
            Text("$9")
                .font(.system(size: 40, weight: .heavy, design: .rounded)) .foregroundColor(.white)
            Text("per month")
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding(40)
        .background(Color.yellow)
        .cornerRadius(10)
    }
}

struct Plans: View {
    
    var title: String
    var price: String
    var validityText : String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        VStack(alignment: .center){
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded)) .foregroundColor(textColor)
            Text(validityText)
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(30)
        .background(bgColor)
        .cornerRadius(10)
    }
}
