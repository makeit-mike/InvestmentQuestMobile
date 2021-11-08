//
//  SettingsView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack{
                // To Do: Build a Settings model that houses all "Settings" These are just place holders.
                SimpleList(textItems: ["Notifications","Location","Fetch Results Hourly","Auto-Bid","Color theme","Icon","Contact","About" ] )
                Spacer()
            }.background(Stocks_GrayBackground)
        }.navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
