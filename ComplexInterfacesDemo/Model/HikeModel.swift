//
//  HikeModel.swift
//  ComplexInterfacesDemo
//
//  Created by Bhushan Mokal on 24/07/23.
//

import Foundation

struct HikeModel: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    static var formatter = LengthFormatter()
    
    var distanceText: String{
        HikeModel.formatter.string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
        
    }
}
