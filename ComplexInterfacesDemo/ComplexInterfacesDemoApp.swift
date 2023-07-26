//
//  ComplexInterfacesDemoApp.swift
//  ComplexInterfacesDemo
//
//  Created by Bhushan Mokal on 24/07/23.
//

import SwiftUI

@main
struct ComplexInterfacesDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}

struct ContentView:View{
    @State private var tabSelection:Tab = .Feature
    
    enum Tab{
        case Feature
        case List
    }
    
    var body: some View{
        TabView(selection: $tabSelection){
            CategoryHome()
                .tabItem{
                    Label("Featured",systemImage: "star")
                       
                }
                .tag(Tab.Feature)
            
            LandmarkList()
                .tabItem{
                    Label("List",systemImage: "list.bullet")
                }
                .tag(Tab.List)
        }
    }
}
