//
//  SwiftUILearningApp.swift
//  SwiftUILearning
//
//  Created by Raman Mann on 23/08/24.
//

import SwiftUI
import Combine

final class Constants : ObservableObject{
    @Published var isLoggedIn = false
    @Published var color = Color.red
}

@main
struct SwiftUILearningApp: App {
    @StateObject var appConstant = Constants()
    var body: some Scene {
        WindowGroup {
           
            SwiftUIForm()
                .environmentObject(appConstant)
        }
    }
}
