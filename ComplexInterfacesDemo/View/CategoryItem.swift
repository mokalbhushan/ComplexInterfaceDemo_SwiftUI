//
//  CategoryItem.swift
//  ComplexInterfacesDemo
//
//  Created by Bhushan Mokal on 25/07/23.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: LandmarkModel
    var body: some View {
        VStack(alignment: .leading){
            landmark.image
                .resizable()
                .frame(width: 155,height: 155)
                .cornerRadius(5)
            
            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading,15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ViewModel().landmarks[0])
    }
}
