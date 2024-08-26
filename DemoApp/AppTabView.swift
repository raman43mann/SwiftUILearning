//
//  SwiftUIView.swift
//  DemoApp
//
//  Created by Raman Mann on 24/08/24.
//

import SwiftUI

struct AppTabView: View {
    //MARK: - Selected index will work with tags
    @State private var selectedIndex = 1
   
    init(){
        configureNavigationBarAppearance()
        configureTabBarAppearance()
    }
    
    var body: some View {
       
        TabView(selection:$selectedIndex){
            
            CustomTabItem(name: "Home", image: "house.fill", view: HomeView()).tag(1)
            
            CustomTabItem(name: "Favorite", image: "star.fill", view: FavoriteView()).tag(2)
            
            CustomTabItem(name: "Posts", image:"list.bullet.rectangle.portrait.fill", view: ListView()).tag(3)
            
            CustomTabItem(name: "Settings", image: "gearshape.fill", view: SettingsView()).tag(4)
            
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }.toolbar(.hidden)
        .accentColor(.red)
        
    }
}


#Preview {
    AppTabView()
}

struct CustomTabItem<CustomViewAnyType:View>: View {
    var name : String
    var image : String
    var view : CustomViewAnyType
    var body: some View {
        NavigationStack(){
            view
                .navigationTitle(name)
                .padding(.zero)
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.white)
                .padding(.zero)
        }
        .tabItem {
            VStack{
                Image(systemName:image)
                    .foregroundColor(.red)
                    .font(.title)
                Text(name)
                    .foregroundColor(.red)
                    .font(.title)
            }
        }
    }
}



private func configureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white // Set background color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black] // Set title color
        
        // Remove default shadow image (divider)
        appearance.shadowImage = UIImage() // Set empty image to hide shadow
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    private func configureTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor.white // Set background color
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
