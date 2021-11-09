//
//  HomeView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI

struct HomeView: View {
    @State private var showSignUpView = false
    @State private var showLogInView  = false

    var body: some View {
        NavigationView{
            VStack{
                Text("Investment Quest")
                    .font(.title)
                    .fontWeight(.semibold)
                Divider()
                Text("Welcome to Investment Quest!\r\nThis app supposedly does things, that will help you out!\r\nSponsored by r/wallstreetbets (not really, but that would be cool)")
                    .padding()
                    .font(.subheadline)
                Spacer()
                HStack {
                    Button(action: {self.showSignUpView.toggle()}) {
                        Text("Sign Up")
                    }.padding().sheet(isPresented: $showSignUpView) {
                        SignUpView(viewShowing: self.$showSignUpView)
                    }
                    
                    Button(action: {self.showLogInView.toggle()}) {
                        Text("Log In")
                    }.padding().sheet(isPresented: $showLogInView) {
                        LogInView(viewShowing: self.$showLogInView)
                    }
                }
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
