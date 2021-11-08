//
//  StockModel.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import Foundation

struct NavButton: Identifiable {
    let id = UUID()
    let navName: String
    let navIcon: String
    let navPath: StocksViewModel.StockViews
}

let NavButtons: [NavButton] = [NavButton(navName: "Portfolio", navIcon: "magazine", navPath: .Portfolio),
                               NavButton(navName: "Search", navIcon: "magnifyingglass", navPath: .Search),
                               NavButton(navName: "Settings", navIcon: "gear", navPath: .Settings)
]

final class StockModel {
    
    
}
