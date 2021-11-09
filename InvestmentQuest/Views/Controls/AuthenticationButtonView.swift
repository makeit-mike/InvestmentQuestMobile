//
//  AuthenticationButtonView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/8/21.
//

import SwiftUI

struct AuthenticationButtonView: View {
    @Binding var viewShowing: Bool
    @State var userName: String
    @State var passWord: String
    @State var authenticationType: Authenticate.AType

    @State var userEmail: String = "" // only needed for Creating an Account.
    @State var showingAlert: Bool = false
    @State var logInMsg: String = ""
    
    
    var body: some View {
        Button(action: {AuthenticationClick()}) {
            Text(authenticationType.rawValue).font(.title2)
        }
        .padding()
        .alert(logInMsg, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func AuthenticationClick() {
        let response = (authenticationType == .LogIn) ?
        Authenticate().LogIn(userName: userName, passWord: passWord) :
        Authenticate().SignUp(userName: userName, passWord: passWord)
        
        if (response == Authenticate.Response.OK){
            viewShowing.toggle()
        }
        else {
            switch response {
            case .LoginFailed:
                logInMsg = "\(authenticationType.rawValue) failed. Please try again."
            case .UnableToConnect:
                logInMsg = "Unable to connect to server."
            default:
                logInMsg = "Unexpected issue occured."
            }
            showingAlert.toggle()
        }
    }
}
