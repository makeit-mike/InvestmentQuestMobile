//
//  StocksViewModel.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import Foundation

final class StocksViewModel: ObservableObject{
    @Published var selectedView: StockViews = StockViews.Search

    enum StockViews: String {
        case Portfolio, Search, Settings
    }

    func SwitchView(itemView: StockViews) {
        selectedView = itemView
    }
}
