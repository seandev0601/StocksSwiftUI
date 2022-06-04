//
//  NewsArticleView.swift
//  StocksSwiftUI
//
//  Created by ChaoBo-Shang on 2022/6/4.
//

import SwiftUI

struct NewsArticleView: View {
    let newsArticles: [NewsArticleViewModel]
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Top News")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .padding(2)
                
                Text("Form News")
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .padding(2)
                
                ScrollView {
                    VStack {
                        ForEach(self.newsArticles, id: \.title) { article in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(article.publication)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .font(.custom("Arial", size: 22))
                                    
                                    Text(article.title)
                                        .foregroundColor(Color.white)
                                        .font(.custom("Arial", size: 22))
                                }
                                
                                Spacer() 
                                
                            }
                        }
                    }.frame(maxWidth: .infinity)
                }
            }
            
        }.frame(width: screenSize.width, height: screenSize.height)
            .background(Color(red: 27/255, green: 28/255, blue: 30/255))
            .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "News Title", imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg", publication: "The WallStreet Journal")
        return NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)])
    }
}
