//
//  DemoAppApp.swift
//  DemoApp
//
//  Created by Raman Mann on 24/08/24.
//

import SwiftUI

@main
struct DemoAppApp: App {
    @State private var isAppLaunching = false
    var body: some Scene {
        WindowGroup {
            if isAppLaunching{
                AppTabView()
            }else{
                SplashScreen(isAppLaunching: $isAppLaunching)
            }
        }
    }
}
