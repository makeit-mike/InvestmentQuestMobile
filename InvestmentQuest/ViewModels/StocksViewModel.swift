//
//  StocksViewModel.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import Foundation
import SwiftUI

final class StocksViewModel: ObservableObject{
    @Published var selectedView: StockViews = StockViews.Home
    
    enum StockViews: String {
        case Portfolio, Search, Settings, Home
    }
    
    func SwitchView(itemView: StockViews) {
        selectedView = itemView
    }
}

final class SearchStockViewModel: ObservableObject{
    @Published var stockSymbol: String = ""
    @Published var shouldShowResults: Bool = false
    @Published var showStockInfo: Bool = false

    // To Do: Pull this data from an API.
    // ex. Call like this: Models.Stocks.GetStockInformation(StockSymbol: stockSymbol)
    @Published var stockPrice: Double = Double(round(100*(Double.random(in: 20.00 ..< 1000.00)) )/100)
    @Published var stockGrowth: Double =  Double(round(1000*(Double.random(in: 0.00 ..< 1.00)))/1000)
    @Published var stockShareHolders: Int = Int.random(in: 50 ..< 10000000)
    @Published var myNumberOfShares: Int = Int.random(in: 0 ..< 15)
}

