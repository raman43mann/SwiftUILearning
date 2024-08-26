//
//  SwiftUIList.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 24/08/24.
//

import SwiftUI

struct SwiftUIList: View {
    
    var array = [DataModal(id:1,title: "Hello World", image: "scene"),
                 DataModal(id:2,title: "Google Lens in Chrome makes it easy to search anything you see on your screen", image: "scene"),
                 DataModal(id:3,title: "By changing one line of code, the app instantly switches to another layout.", image: "scene"),
                 DataModal(id:4,title: "Search anything you see on any page with Google Lens", image: "scene")]
    
   @State private var showDetailview = false
    
    var body: some View {
        
        
        NavigationView{
            //List simple
            
            
            //        List{
            //            Text("Hello, World!")
            //            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            //        }
            
            
            //        // List with for each
            //        List{
            //            ForEach(0...3,id: \.self){ index in
            //                HStack {
            //                    VStack {
            //                        Image("scene")
            //                            .resizable()
            //                            .frame(width: 40, height: 40)
            //                        .cornerRadius(5)
            //                        Spacer()
            //                    }.padding(10)
            //                    Text("\(index) Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World!Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World!")
            //                        .lineLimit(4)
            //                }
            //            }
            //        }
            
            //        //Short hand List with for each
            //        List{
            //            ForEach(0..<4,id: \.self){
            //                Text("\($0) Hello, World!")
            //            }
            //        }
            
            // List with array
            List(array,id: \.id){
                item in
                ZStack{
                    if item.id.isMultiple(of: 2){
//                        ZStack{
//                            ListItemCell(item: item)
//                            Button(action: {
//                                showDetailview.toggle()
//                            }, label: {
//                               
//                            })
//                        }
                       
                            ListItemCell(item: item)
                            .onTapGesture {
                                showDetailview.toggle()
                            }
                            .fullScreenCover(isPresented: $showDetailview, content: {
                                SwiftUIButton()
                            })
//                        .sheet(isPresented: $showDetailview, content: {
//                                SwiftUIButton()
//                        })
                        
                    }else if item.id.isMultiple(of: 3){
                        CardView(image: item.image, name: item.title, detail: "Mann")
                            .padding(.horizontal,0)
                        NavigationLink(destination: SwiftUIStacks()){
                          EmptyView()
                        }
                        .frame(width: 0)
                    }
                    else{
                        Text(item.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal,5)
                        NavigationLink(destination: SwiftUIStacks()){
                          EmptyView()
                        }
                        .frame(width: 0)
                    }
                    
                    
                }
            }
            
            .navigationTitle("Simple List")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    SwiftUIList()
}



struct DataModal:Identifiable,Codable {
    var id = Int()
    var title : String
    var image : String
}

struct ListItemCell: View {
    var item : DataModal
    var body: some View {
        HStack {
            VStack {
                Image(item.image)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(5)
                Spacer()
            }.padding(10)
            Text(item.title)
                .lineLimit(4)
        }
    }
}
