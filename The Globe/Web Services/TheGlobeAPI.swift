//
//  TheGlobeAPI.swift
//  The Globe
//
//  Created by Bilal Khawar on 2024-10-15.
//

import Foundation

// this enum is used to define multiple endpoints
enum EndPoint: String {
    case recommendations = "trending_and_sophi/recommendations.json"
}

struct TheGlobeAPI {
    
    // base url for The Globe request
    private static let baseURLString = "https://d2c9087llvttmg.cloudfront.net/"
    
    static func recommendationsURL() -> URL {
        return URL(string: baseURLString + EndPoint.recommendations.rawValue)!
    }
}
