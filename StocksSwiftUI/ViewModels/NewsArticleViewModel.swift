//
//  ArticleViewModel.swift
//  StocksSwiftUI
//
//  Created by ChaoBo-Shang on 2022/6/4.
//

import Foundation

struct NewsArticleViewModel {
    
    let article: Article
    
    var title: String {
        return self.article.title
    }
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
    
}
