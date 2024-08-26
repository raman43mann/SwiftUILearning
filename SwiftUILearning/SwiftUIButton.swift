//
//  SwiftUIButton.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 23/08/24.
//

import SwiftUI

struct SwiftUIButton: View {
    
    @State private var isPlaying = false
    @State private var greenCounter = 0
    @State private var redCounter = 0
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:20){
          
            HStack {
                Text("\(greenCounter+redCounter)")
                    .frame(width: 50,height: 50)
                    .font(.system(size: 30))
                
                CounterButton(counter: $greenCounter, color: .green)
                CounterButton(counter: $redCounter, color: .red)
            }
            
            Button(action: {
                // Switch between play and stop button
                self.isPlaying.toggle()
            }) {
            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill") .font(.system(size: 80))
            .foregroundColor(isPlaying ? .red : .green)
            }
            
            
            
                Button(action:{
                    print("Hello World tapped!")
                }, label: {
                    
                    let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue,Color.green]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    
                    Text("Press Me")
                        
                        .frame(minWidth: 0,maxWidth: .infinity)
                        .padding()
                    
                        .background(gradient)
                        .foregroundColor(.black)
                        .font(.title)
                        .cornerRadius(40)
                        .padding(.horizontal,40)
                    
                    
                    
                })
            
            
                Button(action:{
                    print("Hello World tapped! 2")
                }, label: {
                    
                    Text("Press Me 2")
                        .padding()
                        .foregroundColor(.black)
                        .font(.title)
                        .background(.gray)
                        .cornerRadius(40)
                        .padding()
                    //  .border(Color.black,width: 5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(.red,lineWidth: 5)
                        }
                    
                    
                    
                })
                
                
                Button(action: {
                    print("Delete tapped!")
                }) {
                    HStack {
                        Image(systemName: "trash")
                            .font(.title)
                        Text("Delete")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(20)
                }
                
                
                Button(action: {
                    print("Print Label Button")
                }, label: {
                    Label(
                        title: { Text("Label Button")
                                .font(.title)
                        },
                        icon: { Image(systemName: "globe")
                                .font(.title)
                        }
                    )
                    .padding()
                    .background(.green)
                    
                })
          
            Spacer()
            
        }.padding(.top,80)
        
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 10)
                Spacer() }

        } )
        Spacer()
            .ignoresSafeArea(SafeAreaRegions.container,edges: .top)
}
}

#Preview {
    SwiftUIButton()
}



struct CounterButton: View {
    @Binding var counter: Int
    var color: Color
    var body: some View {
        Button(action: {
            self.counter += 1
        }) {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .overlay{
                    
                    Text("\(counter)")
                        .font(.system(size: 60, weight: .bold, design: .rounded)) .foregroundColor(.white)
                }
        }
    }
}
