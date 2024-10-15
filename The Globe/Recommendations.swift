//
//  Recommendations.swift
//  The Globe
//
//  Created by Bilal Khawar on 2024-10-15.
//

import Foundation

struct Recommendations: Decodable {
    var articles: [Article]
    
    // Mapping property names to match the JSON keys
    enum CodingKeys: String, CodingKey {
        case articles = "recommendations"
    }
}
