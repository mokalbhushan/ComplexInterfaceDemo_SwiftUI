//
//  LandmarkDetail.swift
//  ComplexInterfacesDemo
//
//  Created by Bhushan Mokal on 25/07/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var dataModel: ViewModel
    
    var landmark:LandmarkModel
    
    var landmarkIndex : Int {
        dataModel.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    var body: some View {
        ScrollView{
            MapView(coordinate: landmark.locationCordinates)
                .frame(height: 250)
                .ignoresSafeArea(edges: .top)
            
            CircleImage(image: landmark.image)
                .offset(y:-170)
                .padding(.bottom,-170)
            
            VStack(alignment: .leading){
                HStack{
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $dataModel.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack{
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                    .font(.body)
                

            }
            .padding()
                        
        }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ViewModel().landmarks[0])
            .environmentObject(ViewModel())
    }
}
