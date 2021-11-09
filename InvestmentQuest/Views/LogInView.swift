//
//  LogInView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/8/21.
//

import SwiftUI

struct LogInView: View {
    @Binding var viewShowing: Bool
    @State var userName: String = ""
    @State var emailAddr: String = ""
    @State var passWord: String = ""
    
    var body: some View {
        VStack {
            VStack{
                Text("Log in Below").font(.title)
                Form {
                    HStack {
                        Text("Username/Email:")
                            .frame(width: 120, alignment: .leading)
                        TextField("Username", text: $userName)
                            .frame(alignment: .trailing)
                    }
                    HStack {
                        Text("Password:")
                            .frame(width: 120, alignment: .leading)
                        SecureField("Password", text: $passWord)
                            .frame(alignment: .trailing)
                    }
                }
            }
            HStack {
                AuthenticationButtonView(
                    viewShowing: self.$viewShowing,
                    userName: self.userName,
                    passWord: self.passWord,
                    authenticationType: .LogIn
                )
                
                Button(action: {viewShowing.toggle()}) {
                    Text("Cancel").font(.title2)
                }.padding()
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    @State static private var showSignUpView = true
    
    static var previews: some View {
        LogInView(viewShowing: self.$showSignUpView)
    }
}
