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
            Divider().background(.black)
            HStack{
                ForEach(NavButtons) { btn in
                    Button(action: {vm.SwitchView(itemView: btn.navPath)}) {
                        VStack {
                            Image(systemName: btn.navIcon)
                                .font(.caption2).frame(width: 15, height: 15)
                            Text(btn.navName)
                                .fontWeight(.light)
                                .font(.caption)
                        }.frame(width: 50, height: 35, alignment: .top)
                            .padding()
                            .cornerRadius(7)
                    }
                }
            }.font(.title2)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: 50,
            alignment: .center
        ).opacity(0.6).padding(3)
        
            
    }
}
