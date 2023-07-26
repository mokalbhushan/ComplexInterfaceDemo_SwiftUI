//
//  LandmarkListRow.swift
//  ComplexInterfacesDemo
//
//  Created by Bhushan Mokal on 26/07/23.
//

import SwiftUI

struct LandmarkListRow: View {
    var landmark: LandmarkModel
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50,height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
        }
    }
}

struct LandmarkListRow_Previews: PreviewProvider {
    static var landmarks = ViewModel().landmarks
    static var previews: some View {
//        Group{
            LandmarkListRow(landmark: landmarks[0])
//            LandmarkListRow(landmark: landmarks[1])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
    }
}
