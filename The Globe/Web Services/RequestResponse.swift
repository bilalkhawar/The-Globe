//
//  RequestResponse.swift
//  The Globe
//
//  Created by Bilal Khawar on 2024-10-15.
//

import Foundation

enum ArticleFetchError: Error {
    case invalidServerResponse
    case decodingError
}

extension ArticleFetchError {
    func title() -> String {
        switch self {
        case .invalidServerResponse:
            return CustomText.Error.invalidServerResponseTitle
        case .decodingError:
            return CustomText.Error.decodingErrorTitle
        }
    }
    
    func message() -> String {
        switch self {
        case .invalidServerResponse:
            return CustomText.Error.invalidServerResponseMessage
        case .decodingError:
            return CustomText.Error.decodingErrorTitle
        }
    }
}

class RequestResponse {
    
    func fetchRecommendedArticles() async throws -> Recommendations {
        let url = TheGlobeAPI.recommendationsURL()
        let (data, response) = try await  URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ArticleFetchError.invalidServerResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let albums = try decoder.decode(Recommendations.self, from: data)
            Storage.store(albums, to: .documents, as: File.articles)
            return albums
        } catch {
            throw ArticleFetchError.decodingError
        }
    }
    
}
