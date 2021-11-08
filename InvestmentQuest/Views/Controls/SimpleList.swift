//
//  SimpleListView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI

struct SimpleList: View {
    @State var textItems: [String]
    var body: some View {
        VStack(alignment: .leading){
            ForEach(textItems, id: \.self){ i in
                Text(i).foregroundColor(.white)
                Divider().background(.black).padding(0)
            }
        }.padding().background(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255)).cornerRadius(15)
    }
}

struct SimpleListView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleList(textItems: [])
    }
}
