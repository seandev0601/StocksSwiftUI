//
//  StockListViewModel.swift
//  StocksSwiftUI
//
//  Created by ChaoBo-Shang on 2022/5/29.
//

import Foundation


class stockListViewModel: ObservableObject{
    
    var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        Webservice().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
    
}
