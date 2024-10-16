//
//  Constants.swift
//  The Globe
//
//  Created by Bilal Khawar on 2024-10-15.
//

import UIKit

struct CustomText {
    static let isProtectedValue = "red"
    static let appTitle = "The Globe"
    
    struct Error {
        static let invalidServerResponseTitle = "Invalid Server Response"
        static let invalidServerResponseMessage = "The server returned an invalid response."
        
        static let decodingErrorTitle = "Decoding Error"
        static let decodingErrorMessage = "There was an issue reading the server response."
        
        static let networkErrorTitle = "Network Error"
        static let networkErrorMessage = "There was an issue connecting to the server. Make sure that you are connected to the internet and try again."
    }
    
    struct Alert {
        static let okAction = "OK"
        static let okActionComment = "OK Action"
    }
}

struct ReuseIdentifier {
    static let articleTableViewCell = "ArticleTableViewCell"
}

struct NibName {
    static let articleTableViewCell = "ArticleTableViewCell"
}

struct TableViewCellHeight {
    static let homeArticles: CGFloat = 96
}

struct File {
    static let articles = "articles.json"
}

struct CustomFonts {
    static let primaryTitle = UIFont.systemFont(ofSize: 20, weight: .semibold)
    static let secondaryTitle = UIFont.systemFont(ofSize: 16, weight: .regular)
}

struct CustomColor {
    static let text = UIColor.label
    static let secondaryText = UIColor.secondaryLabel
}

struct CustomImage {
    static let protectedArticle = UIImage(systemName: "xmark")?.withTintColor(.red)
}
