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
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }.background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.145).edgesIgnoringSafeArea(.all))
        }.navigationTitle("Portfolio")
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
