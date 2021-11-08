//
//  HeaderView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View{
        VStack{
            Text("Investment Quest")
                .fontWeight(.semibold)
                .font(.title)
                .padding(10)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: 90,
            alignment: .topLeading
        )
    }
}
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
