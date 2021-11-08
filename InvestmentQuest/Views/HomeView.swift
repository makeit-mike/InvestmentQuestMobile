//
//  HomeView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Investment Quest")
                    .font(.title)
                    .fontWeight(.semibold)
                Divider()
                Text("Welcome to Investment Quest!\r\nThis app supposedly does things, that will help you out!\r\nSponsored by r/wallstreetbets (not really, but that would be cool")
                    .padding()
                    .font(.subheadline)
                Spacer()
            }.background(Stocks_GrayBackground)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
