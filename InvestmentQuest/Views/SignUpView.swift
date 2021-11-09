//
//  SignUpV.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/8/21.
//

import SwiftUI

struct SignUpView: View {
    @Binding var viewShowing: Bool
    
    @State var userName: String = ""
    @State var emailAddr: String = ""
    @State var passWord: String = ""
    
    var body: some View {
        VStack {
            VStack{
                Text("Sign up Below").font(.title)
                Form {
                    HStack {
                        Text("Username:")
                            .frame(width: 120, alignment: .leading)
                        TextField("Username", text: $userName)
                            .frame(alignment: .trailing)
                    }
                    HStack {
                        Text("Email Address:")
                            .frame(width: 120, alignment: .leading)
                        TextField("Email Address", text: $emailAddr)
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
                    authenticationType: .SignUp,
                    userEmail: self.emailAddr
                )
                
                Button(action: {viewShowing.toggle()}) {
                    Text("Cancel").font(.title2)
                }.padding()
            }
        }
    }
}

struct SignUpV_Previews: PreviewProvider {
    @State static private var showSignUpView = true
    
    static var previews: some View {
        SignUpView(viewShowing: self.$showSignUpView)
    }
}
