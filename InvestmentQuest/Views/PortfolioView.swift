//
//  PortfolioView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        NavigationView{
            VStack{
                HSpacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).padding()
                Spacer()
                // To Do: Pull 'My stocks' from an API. Not sure how anyone would actually do this.. but it should be possible... right?
            }.background(Stocks_GrayBackground)
        }.navigationTitle("Portfolio")
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}

