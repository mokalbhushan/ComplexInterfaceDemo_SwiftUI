//
//  ViewModel.swift
//  ComplexInterfacesDemo
//
//  Created by Bhushan Mokal on 24/07/23.
//

import Foundation
import Combine


final class ViewModel: ObservableObject {
    @Published var landmarks : [LandmarkModel] = load("landmarkData.json")
    
    var features: [LandmarkModel] {
            landmarks.filter { $0.isFeatured }
        }
    
    var categories: [String: [LandmarkModel]] {
        Dictionary(
            grouping: landmarks, by: { $0.category.rawValue}
        )
    }
    
}

func load<T: Decodable>(_ filename:String) -> T {
    let data : Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't find \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
            
}
