//
//  ContentView.swift
//  StocksSwiftUI
//
//  Created by ChaoBo-Shang on 2022/5/29.
//

import SwiftUI

struct ContentView: View {
    @State private var searchTerm: String = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                    .offset(y: -265)
                
                SearchView(searchTerm: $searchTerm)
                    .offset(y: -220)
            
                    .navigationBarTitle("Stocks")
                    .edgesIgnoringSafeArea(.top)
            }.ignoresSafeArea(edges: [.bottom, .trailing, .top])
            // .edgesIgnoringSafeArea(Edge.Set(.bottom))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
