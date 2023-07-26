//
//  ContentView.swift
//  ComplexInterfacesDemo
//
//  Created by Bhushan Mokal on 24/07/23.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var dataModel: ViewModel
    
    var body: some View {
        NavigationView {
            List{
                dataModel.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                
                ForEach (dataModel.categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items:dataModel.categories[key]!)
                    
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ViewModel())
    }
}
