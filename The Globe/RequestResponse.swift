//
//  RequestResponse.swift
//  The Globe
//
//  Created by Bilal Khawar on 2024-10-15.
//

import Foundation

class RequestResponse {
    
    func fetchRecommendedArticles() async throws -> Recommendations {
        let url = TheGlobeAPI.recommendationsURL()
        let (data, response) = try await  URLSession.shared.data(from: url)
        
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//            throw MyNetworkingError.invalidServerResponse
//        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(Recommendations.self, from: data)
    }
    
}
