//
//  SwiftUIForm.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 24/08/24.
//

import SwiftUI

struct SwiftUIForm: View {
//    @Environment var appConstant : Constants
    
    @State private var showDetailview = false
    @State private var showAlert = false
    @State private var selectedItem: DataModal?
    @State private var isToggleOn = false

    var array = [
        DataModal(id: 1, title: "Hello World", image: "scene"),
        DataModal(id: 2, title: "Google Lens in Chrome makes it easy to search anything you see on your screen", image: "scene"),
        DataModal(id: 3, title: "By changing one line of code, the app instantly switches to another layout.", image: "scene"),
        DataModal(id: 4, title: "Search anything you see on any page with Google Lens", image: "scene")
    ]
    
    var body: some View {
        Form {
            Section {
                ForEach(array, id: \.id) { item in
                    ListItemCell(item: item)
                        .onTapGesture {
                            selectedItem = item
                            showDetailview.toggle()
                        }
                }
            } header: {
                Text("Header 1")
//                    .foregroundColor(appConstant.color)
            }
            
            Section {
                HStack {
                    Text("Section cells 2 1")
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                        .onChange(of: isToggleOn, {
                            print(isToggleOn ? "Set On" : "Set Off")
                        })
//                        .onChange(of: isToggleOn) { value in
//                            print(value ? "Set On" : "Set Off")
//                        }
                }
                
                Text("Section cells 2 2")
                    .onTapGesture {
                        showAlert.toggle()
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Hey"),
                            message: Text("How are you?"),
                            primaryButton: .default(Text("Good")) {
                                print("Good")
                            },
                            secondaryButton: .cancel(Text("Not Well")) {
                                print("Not well")
                            }
                        )
                    }
                
            } header: {
                Text("Header 2")
            }
        }
        .fullScreenCover(item: $selectedItem) { item in
            SwiftUIButton()
        }
    }
}

#Preview {
    SwiftUIForm()
}
