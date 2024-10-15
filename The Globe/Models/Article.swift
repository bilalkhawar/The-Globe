//
//  Article.swift
//  The Globe
//
//  Created by Bilal Khawar on 2024-10-15.
//

import Foundation

struct Article: Codable {
    var title: String
    var isProtected: Bool
    var authors: [String]
    var imageURL: String
    
    // Mapping property names to match the JSON keys
    enum CodingKeys: String, CodingKey {
        case title
        case isProtected = "protection_product"
        case authors = "byline"
        case imageURL = "promo_image"
    }
    
    enum ImageCodingKeys: String, CodingKey {
        case urls
    }
    
    enum URLCodingKeys: String, CodingKey {
        case sixFifty = "650"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        
        let protectedValue = try container.decode(String.self, forKey: .isProtected)
        isProtected = protectedValue.lowercased() == CustomText.isProtectedValue
        
        authors = try container.decode([String].self, forKey: .authors)
        
        let urlContainer = try container.nestedContainer(keyedBy: ImageCodingKeys.self, forKey: .imageURL)
        let imageContainer = try urlContainer.nestedContainer(keyedBy: URLCodingKeys.self, forKey: .urls)
        imageURL = try imageContainer.decode(String.self, forKey: .sixFifty)
    }
}
