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
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = CustomText.appTitle
        configureRefreshControl()
        setupTableView()
        fetchArticles()
    }
    
    // MARK: - Private Methods
    
    func configureRefreshControl () {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        refreshControl?.beginRefreshing()
    }
        
    @objc func handleRefreshControl() {
        fetchArticles()
    }
    
    private func setupTableView() {
        let nib = UINib.init(nibName: NibName.articleTableViewCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ReuseIdentifier.articleTableViewCell)
        tableView.estimatedRowHeight = TableViewCellHeight.homeArticles
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func fetchArticles() {
        Task {
            do {
                let recommendations = try await requestResponse.fetchRecommendedArticles()
                articles = recommendations.articles
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            } catch let error as ArticleFetchError {
                let alert = UIAlertController(title: error.title(), message: error.message(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString(CustomText.Alert.okAction, comment: CustomText.Alert.okActionComment), style: .default, handler: { _ in
                }))
                self.present(alert, animated: true, completion: nil)

            }
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

// MARK: - UITableViewDataSource

extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.articleTableViewCell, for: indexPath) as! ArticleTableViewCell
        let article = articles[indexPath.row]
        cell.configureCell(with: article)
        return cell
    }
}
