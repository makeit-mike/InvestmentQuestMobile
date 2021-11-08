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
                Text("Hello {User Name}, tap to view more information").padding()
                SimpleList(textItems: ["TESLA","GOOGL","APPL","BEANS","CHIKN"])
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

