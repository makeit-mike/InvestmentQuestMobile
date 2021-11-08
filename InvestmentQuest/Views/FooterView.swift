//
//  FooterView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI

struct FooterView: View {
    @StateObject var vm: StocksViewModel
    
    var body: some View {
        VStack{
            HStack{
                ForEach(NavButtons) { btn in
                    Button(action: {vm.SwitchView(itemView: btn.navPath)}) {
                        VStack {
                            Image(systemName: btn.navIcon)
                                .font(.title).frame(width: 35, height: 35)
                            Text(btn.navName)
                                .fontWeight(.light)
                                .font(.caption)
                        }.frame(width: 50, height: 50, alignment: .top)
                            .padding(10)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(20)
                    }
                }
            }.font(.title2)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: 50,
            alignment: .center
        ).opacity(0.6)
    }
}
