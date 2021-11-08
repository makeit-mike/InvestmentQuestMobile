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
                SimpleList(textItems: ["Notifications","Location","Fetch Results Hourly","Auto-Bid","Color theme","Icon","Contact","About" ] )
                Spacer()
            }.background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.145).edgesIgnoringSafeArea(.all))
        }.navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
