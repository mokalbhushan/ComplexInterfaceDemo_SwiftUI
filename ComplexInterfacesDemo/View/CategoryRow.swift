//
//  CategoryRow.swift
//  ComplexInterfacesDemo
//
//  Created by Bhushan Mokal on 25/07/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName:String
    var items: [LandmarkModel]
    
    var body: some View {
        
        VStack(alignment:.leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading,15)
                .padding(.top,5)
            
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top,spacing: 0){
                    ForEach(items) { landMark in
                       CategoryItem(landmark: landMark)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ViewModel().landmarks
    static var previews: some View {
        CategoryRow(categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4)))
    }
}
