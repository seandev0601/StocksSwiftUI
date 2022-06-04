//
//  StockListViewModel.swift
//  StocksSwiftUI
//
//  Created by ChaoBo-Shang on 2022/5/29.
//

import Foundation


class StockListViewModel: ObservableObject{
    
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load() {
//        let stock = Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23")
//        self.stocks.append(StockViewModel(stock:stock))
//        self.stocks.append(StockViewModel(stock:stock))
//        self.stocks.append(StockViewModel(stock:stock))
//        return StockListView(stocks: [StockViewModel(stock:stock)])
        fetchStocks()
    }
    
    private func fetchStocks() {
        Webservice().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            } else {
                DispatchQueue.main.async {
                    self.stocks.append(StockViewModel(stock:Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23")))
                    self.stocks.append(StockViewModel(stock:Stock(symbol: "MSFT", description: "Microsoft Stocks", price: 600, change: "+0.3")))
                    self.stocks.append(StockViewModel(stock:Stock(symbol: "FB", description: "Facebook Stocks", price: 1800, change: "+1.3")))
                    self.stocks.append(StockViewModel(stock:Stock(symbol: "APPLE", description: "Apple Stocks", price: 1500, change: "+2.3")))
                }
            }
        }
    }
    
}
