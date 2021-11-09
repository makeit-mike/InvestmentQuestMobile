//
//  Authenticate.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/8/21.
//

import Foundation

final class Authenticate {
    
    enum AType : String {
        case LogIn = "Log In"
        case SignUp = "Sign Up"
        case OAuth = "OAuth"
    }
    
    enum Response {
        case OK
        case LoginFailed
        case UnableToConnect
    }

    func LogIn(userName: String, passWord: String) -> Response {
       
        return Response.OK
    }

    func SignUp(userName: String, passWord: String) -> Response {
        if (userName.count == 0 && passWord.count == 0) {
            return Response.LoginFailed
        }
        
        return Response.OK
    }

    func OAuthLogIn() -> Response {
        return Response.UnableToConnect
    }
}
