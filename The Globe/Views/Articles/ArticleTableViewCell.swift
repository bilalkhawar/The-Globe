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
        authorLabel.font = CustomFonts.secondaryTitle
        authorLabel.textColor = CustomColor.secondaryText
    }
    
    func configureCell(with article: Article) {
        let headline = article.title
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: CustomColor.text,
            NSAttributedString.Key.font: CustomFonts.primaryTitle
        ]
        let attributedString = NSMutableAttributedString(string: headline, attributes: attributes)
        if article.isProtected {
            let imageAttachment = NSTextAttachment()
            attributedString.append(NSAttributedString(string: " "))
            imageAttachment.image = CustomImage.protectedArticle
            attributedString.append(NSAttributedString(attachment: imageAttachment))
        }
        headlineLabel.attributedText = attributedString
        
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
