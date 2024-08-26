//
//  SwiftUIScroll.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 23/08/24.
//

import SwiftUI

struct SwiftUIScroll: View {
    var body: some View {
   
            ScrollView(showsIndicators:false){
                VStack(spacing:10){
                    CardView(image: "scene", name: "Sunil Chetri", detail: "An Indian football, mamximum goal achiever in the world, He is very famous")
                    CardView(image: "scene", name: "Blog Messy", detail: "A Argentina Footballer")
                    CardView(image: "scene", name: "Ronaldo Crist.", detail: "A Portugies footballassociatiuon chairman and player")
                }.cornerRadius(20)
            }
            
        
        ScrollView(.horizontal){
            HStack(spacing:10){
                Group {
                    CardView(image: "scene", name: "Sunil Chetri", detail: "An Indian football, mamximum goal achiever in the world, He is very famous")
                    
                    
                    CardView(image: "scene", name: "Blog Messy", detail: "A Argentina Footballer")
                    
                    
                    CardView(image: "scene", name: "Ronaldo Crist.", detail: "A Portugies footballassociatiuon chairman and player")
                    
                }.frame(width: 300,height: 400)
                
            }.cornerRadius(20)
            
        }
            
    }
}

#Preview {
    SwiftUIScroll()
}

struct CardView: View {
    var image : String
    var name : String
    var detail :String
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .padding(.bottom,1)
            HStack {
                VStack(alignment:.leading){
                    Text(name)
                        .fontWeight(.heavy)
                        .font(.system(size: 42))
                    Text(detail)
                        .fontWeight(.medium)
                        .font(.system(size: 22))
                        .lineLimit(4)
                }
                Spacer()
            }.padding(10)
            Spacer()
        }.cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.2))
                .shadow(radius: 20)
            
        }.padding([.top,.horizontal])
        
    }
}
