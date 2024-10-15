//
//  ArticleTableViewCell.swift
//  The Globe
//
//  Created by Bilal Khawar on 2024-10-15.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with article: Article) {
        headlineLabel.text = article.title
        
        if article.authors.count == 0 {
            authorLabel.isHidden = true
        } else {
            authorLabel.isHidden = false
            var authors = article.authors.joined(separator: ", ")
            if let range = authors.range(of: ",", options: .backwards) {
                authors = authors.replacingCharacters(in: range, with: " and")
            }
            authorLabel.text = authors.uppercased()
        }
        
        if let imageURL = URL(string: article.imageURL) {
            articleImageView.sd_setImage(with: imageURL, placeholderImage: nil)
        }
    }
    
}
