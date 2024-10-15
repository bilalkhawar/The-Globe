//
//  HomeTableViewController.swift
//  The Globe
//
//  Created by Bilal Khawar on 2024-10-15.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    private var requestResponse = RequestResponse()
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArticles()
    }
    
    // MARK: - Private Methods
    
    private func fetchArticles() {
        Task {
            do {
                let recommendations = try await requestResponse.fetchRecommendedArticles()
                articles = recommendations.articles
            } catch let error as ArticleFetchError {
                let alert = UIAlertController(title: error.title(), message: error.message(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString(CustomText.Alert.okAction, comment: "Default action"), style: .default, handler: { _ in
                }))
                self.present(alert, animated: true, completion: nil)

            }
        }
    }
}
