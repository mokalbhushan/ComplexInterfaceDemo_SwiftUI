//
//  LandmarkList.swift
//  ComplexInterfacesDemo
//
//  Created by Bhushan Mokal on 26/07/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var dataModel: ViewModel
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [LandmarkModel]{
        dataModel.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favotites only")
                }
                
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkListRow(landmark: landmark)
                    }
                    
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ViewModel())
    }
}
