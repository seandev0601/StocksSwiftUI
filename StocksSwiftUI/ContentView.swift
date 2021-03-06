//
//  ContentView.swift
//  StocksSwiftUI
//
//  Created by ChaoBo-Shang on 2022/5/29.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        
        stockListVM.load()
    }
    
    var body: some View {
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm) }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                        
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -210)
                        
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -170)
                        
                StockListView(stocks: filteredStocks)
                    .offset(y: 140)
                
                NewsArticleView(newsArticles: self.stockListVM.news, onDragBegin: { value in
                    self.stockListVM.dragOffset = value.translation
                }, onDragEnd: { value in
                    
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 150)
                    } else {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 400)
                    }
                    
                })
                .animation(.spring())
                .offset(y: self.stockListVM.dragOffset.height)
            }
                    
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
            
    }
}
